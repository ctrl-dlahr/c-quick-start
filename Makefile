EXEC = main
CXX = gcc
CFLAGS = -std=iso9899:1999 -Wall -Wextra -Wshadow -Wpointer-arith -Wcast-qual -Wcast-align -Wstrict-prototypes -Wmissing-prototypes -Wconversion
LDFLAGS = -lm

INCDIR =./include
OBJDIR = ./obj
BINDIR = ./bin
SRCDIR = ./src

CFLAGS += -I$(INCDIR) -I$(SRCDIR)

# add sources for compilation
SOURCES = main.c

_OBJ = $(SOURCES:.c=.o)
OBJ = $(patsubst %,$(OBJDIR)/%,$(_OBJ))

all: $(BINDIR)/$(EXEC)

$(BINDIR)/$(EXEC): $(OBJ)
	$(CXX) -o $(BINDIR)/$(EXEC) $(OBJ) $(LDFLAGS)

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CXX) -c -o $@ $< $(CFLAGS)

clean:
	rm -vf $(BINDIR)/$(EXEC) $(OBJ)
