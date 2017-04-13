# Makefile for odt.c
#

PRODUCT = ./corr

SOURCES= correlation.c 
OBJECTS= correlation.o
CC= gcc

all: $(PRODUCT)
$(PRODUCT): $(OBJECTS)

$(OBJECTS):$(SOURCES)
	$(CC) -c $(SOURCES)

clean:
	rm -f *.o
