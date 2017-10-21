#include <ini_parse.h>

#include <bits/types/FILE.h>
#include <stdio.h>
#include <malloc.h>

void keyCb(const char *section, const char *key, const char *value, void *userData)
{
	printf("\033[36m[ \"%s\" ]\033[m ", section);
	printf("\033[32m\"%s\"\033[m = ", key);
	printf("\033[33m\"%s\"\033[m\n", value);
}

int main(int argc, char **argv)
{
	int i;
	char *buffer = 0;
	size_t length = 0;
	FILE *f = fopen(argv[1], "rb");

	if (f) {
		fseek(f, 0, SEEK_END);
		length = (size_t) ftell(f);
		fseek(f, 0, SEEK_SET);
		buffer = malloc(length+1);
		if (buffer) {
			fread(buffer, 1, length, f);
		}
		fclose(f);
	}

	if (buffer) {
		ini_parse_begin(keyCb, NULL);
		ini_parse(buffer, 0);
		ini_parse_end();
	}

	return 0;
}
