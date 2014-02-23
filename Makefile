CC=gcc
CFLAGS=-g

all: sinecycle.o midi2freq.o
	$(CC) sinecycle.o -o sinecycle
	$(CC) midi2freq.o -o midi2freq

all-debug: sinecycleT.o midi2freqT.o
	$(CC) sinecycleT.o -o sinecycle
	$(CC) midi2freqT.o -o midi2freq

sinecycle: sinecycle.o
	$(CC) sinecycle.o -o sinecycle

midi2freq: midi2freq.o
	$(CC) midi2freq.o -o midi2freq

sinecycle-debug: sinecycleT.o
	$(CC) sinecycleT.o -o sinecycle

midi2freq-debug: midi2freqT.o
	$(CC) midi2freqT.o -o midi2freq

sinecycleT.o: sinecycle.c
	$(CC) $(CFLAGS) sinecycle.c

midi2freqT.o: midi2freq.c
	$(CC) $(CFLAGS) midi2freq.c 

sinecycle.o: sinecycle.c
	$(CC) sinecycle.c

midi2freq.o: midi2freq.c
	$(CC) midi2freq.c

clean:
	rm -rf *.o sinecycle midi2freq

