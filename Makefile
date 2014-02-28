CC=gcc
CFLAGS:=

#Linking all outputs from compilation
all: CFLAGS= -L lib/
all: portsf/portsf/libportsf.a sinecycle.o midi2freq.o wav2aif.o
	$(CC) sinecycle.o -o sinecycle
	$(CC) midi2freq.o -o midi2freq
	$(CC) wav2aif.o portsf/lib/libportsf.a -o wav2aif

#Linking all outputs from compilation
all-debug: CFLAGS= -L lib/
all-debug:  portsf/portsf/libportsf.a sinecycleT.o midi2freqT.o wav2aifT.o
	$(CC) sinecycleT.o -o sinecycle
	$(CC) midi2freqT.o -o midi2freq
	$(CC) wav2aifT.o portsf/lib/libportsf.a -o wav2aif

#Linking sinecycle from compilation
sinecycle: CFLAGS= -o sinecycle -L lib/
sinecycle: sinecycle.o
	$(CC) $(CFLAGS) sinecycle.o 

#Linking midi2freq from compilation
midi2freq: CFLAGS= -o midi2freq -L lib/
midi2freq: midi2freq.o
	$(CC) $(CFLAGS) midi2freq.o 

#Linking wav2Aif
wav2aif: CFLAGS= -o wav2aif 
wav2aif: wav2aif.o
	$(CC) $(CFLAGS) wav2aif.o portsf/lib/libportsf.a

#Linking debug compatiblie sinecycle
sinecycle-debug: CFLAGS= -o sinecycle -I include/ 
sinecycle-debug: sinecycleT.o
	$(CC) $(CFLAGS) sinecycleT.o 

#Linking debug compatibile midi2freq
midi2freq-debug: CFLAGS= -o midi2freq -I include/ 
midi2freq-debug: midi2freqT.o
	$(CC) $(CFLAGS) midi2freqT.o 

#Linking debug compatibile wav2aif
wav2aif-debug: CFLAGS= -o wav2aif 
wav2aif-debug: wav2aifT.o
	$(CC) $(CFLAGS) wav2aifT.o portsf/portsf/libportsf.a

#Individual compilation targets
sinecycle.o: CFLAGS= -c -o sinecycle.o -I include/ 
sinecycle.o: sinecycle.c
	$(CC) $(CFLAGS) sinecycle.c 

midi2freq.o: CFLAGS= -c -o midi2freq.o -I include/ 
midi2freq.o: midi2freq.c
	$(CC) $(CFLAGS) midi2freq.c 

wav2aif.o: CFLAGS= -c -o wav2aif.o -I include -I portsf/include/
wav2aif.o: wav2aif.c
	$(CC) $(CFLAGS) wav2aif.c

#Individual compilation targets with debug compatibility
sinecycleT.o: CFLAGS= -c -g -o sinecycleT.o -I include/
sinecycleT.o: sinecycle.c
	$(CC) $(CFLAGS) sinecycle.c

midi2freqT.o: CFLAGS= -c -g -o midi2freqT.o -I include/
midi2freqT.o: midi2freq.c
	$(CC) $(CFLAGS) midi2freq.c 

wav2aifT.o: CFLAGS= -c -g -o wav2aifT.o -I include/ -I portsf/include/
wav2aifT.o: wav2aif.c
	$(CC) $(CFLAGS) wav2aif.c

#Target to compile portsf library
portsf/portsf/libportsf.a:
	make -C portsf/portsf/ -f Makefile install

#Target to remove all compiled files, and reset portsf library
clean:
	rm -rf *.o *.out* sinecycle midi2freq wav2aif
	make -C portsf/portsf/ -f Makefile veryclean

