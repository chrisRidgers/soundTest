CC=gcc
CFLAGS:=

all: CFLAGS+= -L lib/
all: portsf/portsf/libportsf.a sinecycle.o midi2freq.o 
	$(CC) sinecycle.o -o sinecycle
	$(CC) midi2freq.o -o midi2freq

all-debug: CFLAGS+= -L lib/
all-debug:  portsf/portsf/libportsf.a sinecycleT.o midi2freqT.o
	$(CC) sinecycleT.o -o sinecycle
	$(CC) midi2freqT.o -o midi2freq

sinecycle: CFLAGS+= -o sinecycle -I include/
sinecycle: sinecycle.o
	$(CC) $(CFLAGS) sinecycle.o 

midi2freq: CFLAGS+= -o midi2freq -I include/
midi2freq: midi2freq.o
	$(CC) $(CFLAGS) midi2freq.o 

sinecycle-debug: CFLAGS+= -o sinecycle -I include/ 
sinecycle-debug: sinecycleT.o
	$(CC) $(CFLAGS) sinecycleT.o 

midi2freq-debug: CFLAGS+= -o midi2freq -I include/ 
midi2freq-debug: midi2freqT.o
	$(CC) $(CFLAGS) midi2freqT.o 

sinecycleT.o: CFLAGS+= -c -g -o sinecycleT.o -I include/ 
sinecycleT.o: sinecycle.c
	$(CC) $(CFLAGS) sinecycle.c

midi2freqT.o: CFLAGS+= -c -g -o midi2freqT.o -I include/ 
midi2freqT.o: midi2freq.c
	$(CC) $(CFLAGS) midi2freq.c 

sinecycle.o: CFLAGS+= -c -o sinecycle.o -I include/ 
sinecycle.o: sinecycle.c
	$(CC) $(CFLAGS) sinecycle.c 

midi2freq.o: CFLAGS+= -c -o midi2freq.o -I include/ 
midi2freq.o: midi2freq.c
	$(CC) $(CFLAGS) midi2freq.c 

portsf/portsf/libportsf.a:
	make -C portsf/portsf/ -f Makefile install

clean:
	rm -rf *.o *.out* sinecycle midi2freq
	make -C portsf/portsf/ -f Makefile veryclean

