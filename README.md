# Mini INI parser

Simple INI parser in C that works in a streaming fashion, 
without keeping the entire file in memory.

## Usage

For details, see the Doxygen comments in `ini_parse.h`.

The parser processes the input data and calls a calback with the section, key and value
whenever a key-value pair is fully processed.

There are two ways to use the parser:

- parsing a single string buffer
  - In this case, call `ini_parse_file()` with the data and callback

- parsing a byte stream
  - Start by calling `ini_parse_begin()` with the callback
  - For each piece of data, call `ini_parse()`
  - When done, call `ini_parse_end()`, this processes any remaining data in the parser
    (e.g. last key-value, if not followed by a newline), and removes the callback

- At any time, call `ini_parse_reset()` to clear the internal state.

`ini_parse_begin()` and `ini_parse_file()` take an optional argument
`void *userData`. This can be used for passing a context struct to the callback.
Don't forget to dispose of the struct when done with the parser.

Strings passed to the callback are transient, backed by the parser's static buffers.
Use `strdup()` or similar if you wish to use them after the function exits.

The parser is not re-entrant, it's no expected that it will be used
in multiple threads at once.

## Supported syntax

The INI format is not well defined and as a consequence there is a wide range 
of its variants used in the wild. This parser supports many of the most common
formatting conventions and is able to recover from syntax errors.

```ini
; this is a comment
# another comment

; Keys before any section are in "global scope"
;  and their section is "" - empty string

; The parser does NOT detect duplicate keys.
;  Both colons : and equals = can be used
foo=bar
foo:bar

; Surrounding whitespace is ignored, e.g.
     this     =    is okay   
; equals to
this=is okay

  indenting=is fine

; keys can contain anything except : and =
for.instance/this+is perfectly = okay

; utf8 can be safely used as part of keys or values
žížala = růžová

; Comments can't be on the same line as value
foo=bar ; this is not a comment
baz=ook # neither is this

; BUT: If the value is quoted, comments can be added after it:
key="value" # This is a comment!!
; single quotes also work:
key='value'

; Quotes can be used to...
add = "  whitespace before and after   "

; Escape sequences are supported:
hello="newline \n quote \" backslash \\ apos \' ..."

; This is a section
[section1]

; Surrounding whitespace is ignored
[    this is a section   ] ; and comments discarded

; Sections cannot be nested - but you can use eg. 
[group.section]

```

