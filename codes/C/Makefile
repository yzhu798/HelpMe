CC = gcc
CFLAGS = -g -Wall -std=c99

TARGETS = 01_helloworld

all: $(TARGETS) libhelloworld.a libhelloworld.so

libhelloworld.a: 03_helloworld.c
	$(CC) -o 03_helloworld.o -c 03_helloworld.c
	ar crv libhelloworld.a 03_helloworld.o

libhelloworld.so: 04_helloworld.c
	$(CC) -shared -o libhelloworld.so -fPIC 04_helloworld.c

clean:
	-rm -f $(TARGETS) *.o *.a *.so
