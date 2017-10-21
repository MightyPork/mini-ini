
/* Ragel constants block */
#include "ini_parse.h"

#include <stdint.h>
#include <stdbool.h>
#include <memory.h> // strlen

#define INI_KEY_MAX 128
#define INI_VALUE_MAX 512

%%{
	machine ini;
	write data;
	alphtype unsigned char;
}%%

// Persistent state
static int8_t cs = -1;
static char keybuf[INI_KEY_MAX];
static char secbuf[INI_KEY_MAX];
static uint32_t buff_i = 0;
static char valbuf[INI_VALUE_MAX];
static char value_quote = 0;
static bool value_nextquoted = false;
static IniParserCallback keyCallback = NULL;
static void *userdata = NULL;

void ini_parse_reset_partial(void)
{
	buff_i = 0;
	value_quote = 0;
	value_nextquoted = false;
}

void ini_parse_reset(void)
{
	ini_parse_reset_partial();
	keybuf[0] = secbuf[0] = valbuf[0] = 0;
	%% write init;
}

void ini_parser_error(const char* msg)
{
	ini_error("Parser error: %s", msg);
	ini_parse_reset_partial();
}


void ini_parse_begin(IniParserCallback callback, void *userData)
{
	keyCallback = callback;
	userdata = userData;
	ini_parse_reset();
}


void *ini_parse_end(void)
{
	ini_parse("\n", 1);
	if (keyCallback) {
		keyCallback = NULL;
	}

	void *ud = userdata;
	userdata = NULL;
	return ud;
}


void ini_parse_file(const char *text, size_t len, IniParserCallback callback, void *userData)
{
	ini_parse_begin(callback, userData);
	ini_parse(text, len);
	ini_parse_end();
}

static void rtrim_buf(char *buf, int32_t end)
{
	if (end > 0) {
		while ((uint8_t)buf[--end] < 33);
		end++; // go past the last character
	}

	buf[end] = 0;
}


void ini_parse(const char *newstr, size_t len)
{
	int32_t i;
	char c;
	bool isnl;
	bool isquot;

	// Load new data to Ragel vars
	const uint8_t *p;
	const uint8_t *eof;
	const uint8_t *pe;

	if (len == 0) len = strlen(newstr);

	p = (const uint8_t *) newstr;
	eof = NULL;
	pe = (const uint8_t *) (newstr + len);

	// Init Ragel on the first run
	if (cs == -1) {
		ini_parse_reset();
	}

	// The parser
	%%{
#/ *
		ispace = [ \t]; # inline space
		wchar  = any - 0..8 - 10..31;
		#apos  = '\'';
		#quot  = '\"';
		nonl   = [^\r\n];
		nl     = '\r'? '\n';

		# ---- [SECTION] ----

		action sectionStart {
			buff_i = 0;
			fgoto section;
		}

		action sectionChar {
			if (buff_i >= INI_KEY_MAX) {
				ini_parser_error("Section name too long");
				fgoto discard2eol;
			}
			keybuf[buff_i++] = fc;
		}

		action sectionEnd {
			// we need a separate buffer for the result, otherwise a failed
			// partial parse would corrupt the section string
			rtrim_buf(keybuf, buff_i);
			for(i=0;i<buff_i;i++) secbuf[i] = keybuf[i]; // this can copy slightly more than necessary, but not a big deal
			fgoto main;
		}

		section :=
			(
				ispace* <: ((wchar - ']')+ @sectionChar) ']' @sectionEnd
			) $!{
				ini_parser_error("Syntax error in [section]");
				if(fc == '\n') fgoto main; else fgoto discard2eol;
			};

		# ---- KEY=VALUE ----

		action keyStart {
			buff_i = 0;
			keybuf[buff_i++] = fc; // add the first char
			fgoto keyvalue;
		}

		action keyChar {
			if (buff_i >= INI_KEY_MAX) {
				ini_parser_error("Key too long");
				fgoto discard2eol;
			}
			keybuf[buff_i++] = fc;
		}

		action keyEnd {
			rtrim_buf(keybuf, buff_i);

			// --- Value begin ---
			buff_i = 0;
			value_quote = 0;
			value_nextquoted = false;
		}

		action valueChar {
			isnl = (fc == '\r' || fc == '\n');
			isquot = (fc == '\'' || fc == '"');

			// detect our starting quote
			if (isquot && !value_nextquoted && buff_i == 0 && value_quote == 0) {
				value_quote = fc;
				goto valueCharDone;
			}

			if (buff_i >= INI_VALUE_MAX) {
				ini_parser_error("Value too long");
				fgoto discard2eol;
			}

			// end of string - clean up and report
			if ((!value_nextquoted && fc == value_quote) || isnl) {
				if (isnl && value_quote) {
					ini_parser_error("Unterminated string");
					fgoto main;
				}

				// unquoted: trim from the end
				if (!value_quote) {
					rtrim_buf(valbuf, buff_i);
				} else {
					valbuf[buff_i] = 0;
				}

				if (keyCallback) {
					keyCallback(secbuf, keybuf, valbuf, userdata);
				}

				// we don't want to discard to eol if the string was terminated by eol
				// - would delete the next line

				if (isnl) {
					fgoto main;
				} else {
					fgoto discard2eol;
				}
			}

			c = fc;
			// escape...
			if (value_nextquoted) {
				if (fc == 'n') c = '\n';
				else if (fc == 'r') c = '\r';
				else if (fc == 't') c = '\t';
				else if (fc == 'e') c = '\033';
			}

			// collecting characters...
			if (value_nextquoted || fc != '\\') { // is quoted, or is not a quoting backslash - literal character
				valbuf[buff_i++] = c;
			}

			value_nextquoted = (!value_nextquoted && fc == '\\');
valueCharDone:;
		}

		# use * for key, first char is already consumed.
		keyvalue :=
			(
				([^\n=:]* @keyChar %keyEnd)
				[=:] ispace* <: nonl* @valueChar nl @valueChar
			) $!{
				ini_parser_error("Syntax error in key=value");
				if(fc == '\n') fgoto main; else fgoto discard2eol;
			};

		# ---- COMMENT ----

		comment :=
			(
				nonl* nl
				@{ fgoto main; }
			) $!{
				ini_parser_error("Syntax error in comment");
				if(fc == '\n') fgoto main; fgoto discard2eol;
			};

		# ---- CLEANUP ----

		discard2eol := nonl* nl @{ fgoto main; };

		# ---- ROOT ----

		main :=
			(space*
				(
					'[' @sectionStart |
					[#;] @{ fgoto comment; } |
					(wchar - [\t =:]) @keyStart
				)
			) $!{
				ini_parser_error("Syntax error in root");
				fgoto discard2eol;
			};

		write exec;
#*/
	}%%
}
