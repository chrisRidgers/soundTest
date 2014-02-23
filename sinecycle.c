#include <stdio.h>
#include <stdlib.h>
#include <math.h>

enum{ARG_NAME, ARG_SAMP_RATE, ARG_SINE_FREQ, ARGC};

int main(int argc, char *argv[])
{
	if(argc!=ARGC)
	{
		printf("Invalid Argments\n");
		return 1;
	}
	
	long sampleRate = atol(argv[ARG_SAMP_RATE]);
	float samplingPeriod = 1.0/sampleRate;
	float sineFreq = atof(argv[ARG_SINE_FREQ]);
	float sinePeriod = 1.0/sineFreq;
	float value;

	printf("\ntime\t\tvalue\n");
	for(float time = 0; time <= sinePeriod; time+= samplingPeriod)
	{
		value = sin(2*M_PI * sineFreq * time);
		printf("%f\t%f\n", time, value);
	}

	printf("Sine Period:\t%f\n", sinePeriod);
	return 0;
}


