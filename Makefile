# Compile with gcc with flags
CC	= gcc
CFLAGS	= -Os -Wall -std=gnu89 -Iinclude -Wno-unused -DINI_DEBUG

# Create .a file (archive)
AR	= ar
ARFLAGS	= cr

# Separate directory for .o files
OBJDIR	= build
# Directory for sources
SRCDIR	= src

# Object names. Uses basenm to create full names
BASENM	= ini_parse
OBJS	= $(addsuffix .o, $(addprefix $(OBJDIR)/, $(BASENM)) )

# Target library file
TARGET = libiniparser.a

INSTALL_PREFIX	?= /usr
HEADERS	= include/iniparse.h include/ini_parse.h

#-- EXAMPLE
EXAMPLE_TARGET = examples/test
EXAMPLE_SRC = examples/example.c




all: $(TARGET)

ragel:
	ragel -L -G0 src/ini_parse.rl -o src/ini_parse.c

test:
	make ragel
	make examples -B
	cd examples && ./test "test1.ini"

# TARGET need all the objects
$(TARGET): $(OBJS)
	$(AR) $(ARFLAGS) $(TARGET) $(OBJS)

# Objects need each object file which needs according .c file
$(OBJS): $(OBJDIR)/%.o: $(SRCDIR)/%.c
	mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -o $@ -c $<

# Remove build directory and target file
clean:
	rm -rf $(OBJDIR) $(TARGET)
	rm -f $(EXAMPLE_TARGET)

examples: all $(EXAMPLE)
	$(CC) $(CFLAGS) -o $(EXAMPLE_TARGET) $(EXAMPLE_SRC) -L. -liniparser

.PHONY: all clean examples
