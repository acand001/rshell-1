SRCDIR = src
BIN	= bin/

CC	= g++
CFLAGS	= -Wall -Werror -ansi -pedantic

HDRS	= $(shell find $(SRCDIR) -name '*.h')
SRC		= $(shell find $(SRCDIR) -name '*.cpp')
OBJS	= $(SRC:.cpp=.o) $(shell find $(SRCDIR) -name '*.o')

all: clean rshell

rshell: 
	mkdir -p bin
	$(CC) $(CFLAGS) $(LIBS) $(SRC) -o $(BIN)rshell

clean: 
	rm -rf $(OBJS) $(BIN)$(TARGET) bin