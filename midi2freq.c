#include <stdio.h>
#include <stdlib.h>
#include <math.h>

enum{ARG_NAME, ARG_INPUT, ARG_OUTPUT, ARGC};

int main(int argc, char *argv[])
{
	float note;
	float volume;
	float duration;

	if(argc!=ARGC)
	{
		printf("Please use midi2freq as: midi2freq INPUT_MIDI_TXT OUTPUT_TXT\n");
		return 1;
	}

	FILE *input;
	input = fopen(argv[ARG_INPUT], "r");
	if(input==NULL) return 1;
	FILE *output; 
	output  = fopen(argv[ARG_OUTPUT], "w");
	if(input==NULL) return 1;

	while(fscanf(input, "%f %f %f", &note, &volume, &duration)!=EOF)
	{
		float frequency = pow(2, (note-69)/12)*440;
		float amplitude = volume/127;
		fprintf(output, "%f\t%f\t%f\n", frequency, amplitude, duration);
	}
		fclose(input);
		fclose(output);
	return 0;
}


