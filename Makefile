CC=gcc
CFLAGS:=

all: sinecycle.o midi2freq.o
	$(CC) sinecycle.o -o sinecycle
	$(CC) midi2freq.o -o midi2freq

all-debug: sinecycleT.o midi2freqT.o
	$(CC) sinecycleT.o -o sinecycle
	$(CC) midi2freqT.o -o midi2freq

sinecycle: CFLAGS+= -o sinecycle
sinecycle: sinecycle.o
	$(CC) $(CFLAGS) sinecycle.o -o sinecycle

midi2freq: CFLAGS+= -o midi2freq
midi2freq: midi2freq.o
	$(CC) $(CFLAGS) midi2freq.o -o midi2freq

sinecycle-debug: CFLAGS+= -o sinecycle
sinecycle-debug: sinecycleT.o
	$(CC) $(CFLAGS) sinecycleT.o -o sinecycle

midi2freq-debug: CFLAGS+= -o midi2freq
midi2freq-debug: midi2freqT.o
	$(CC) $(CFLAGS) midi2freqT.o -o midi2freq

sinecycleT.o: CFLAGS+= -c -g -o sinecycleT.o
sinecycleT.o: sinecycle.c
	$(CC) $(CFLAGS) sinecycle.c

midi2freqT.o: CFLAGS+= -c -g -o midi2freqT.o
midi2freqT.o: midi2freq.c
	$(CC) $(CFLAGS) midi2freq.c 

sinecycle.o: CFLAGS+= -c -o sinecycle.o
sinecycle.o: sinecycle.c
	$(CC) $(CFLAGS) sinecycle.c 

midi2freq.o: CFLAGS+= -c -o midi2freq.o
midi2freq.o: midi2freq.c
	$(CC) $(CFLAGS) midi2freq.c 

clean:
	rm -rf *.o *.out* sinecycle midi2freq

