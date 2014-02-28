#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <portsf.h>

enum{ARG_NAME, ARG_INPUT, ARG_OUTPUT, ARGC};

int main(int argc, char *argv[])
{
	PSF_PROPS props;
	int infile;
	int outfile;
	float *buffer;
	long num_frames;

	if(argc!=ARGC)
	{
		printf("Please use wav2aif as: wav2aif INPUT_WAV OUTPUT_AIF\n");
		return 1;
	}

	if(psf_init())
	{
		printf("Error: unable to open portsf\n");
		return 1;
	}

	infile = psf_sndOpen(argv[ARG_INPUT], &props, 0);
	if(infile<0)
	{
		printf("Error, unable to read %s\n", argv[ARG_INPUT]);
		return 1;
	}

	props.format = PSF_AIFF;

	outfile = psf_sndCreate(argv[ARG_OUTPUT], &props, 0, 0, PSF_CREATE_RDWR);
	if(outfile<0)
	{
		printf("Unable to create %s\n", argv[ARG_OUTPUT]);
		return 1;
	}

	num_frames = (long)psf_sndSize(infile);
	buffer = (float*)malloc(num_frames*props.chans*sizeof(float));
	if(buffer==NULL)
	{
		printf("Error unable to allocate buffer\n");
		if(psf_sndClose(infile))
		{
			printf("Warning: error closing %s\n", argv[ARG_INPUT]);
		}
		if(psf_sndClose(outfile))
		{
			printf("Warning: error closing %s\n", argv[ARG_OUTPUT]);
		}
		return 1;
	}
	printf("Reading %s to buffer \n", argv[ARG_INPUT]);

	if(psf_sndReadFloatFrames(infile, buffer, num_frames) !=num_frames)
	{
		printf("Warning: error writing %s\n", argv[ARG_OUTPUT]);
		return 1;
	}

	printf("Writing %s ... \n", argv[ARG_OUTPUT]);
	if(psf_sndWriteFloatFrames(outfile, buffer, num_frames) != num_frames)
	{
		printf("Warning: error writing %s\n", argv[ARG_OUTPUT]);
		return 1;
	}

	if(infile >= 0)
	{
		if(psf_sndClose(infile))
		{
			printf("Warning error closing %s\n", argv[ARG_INPUT]);
		}
	}
	if(outfile >= 0)
	{
		if(psf_sndClose(outfile))
		{
			printf("Warning error closing %s\n", argv[ARG_OUTPUT]);
		}
		printf("Closed fine \n");
	}
	
	psf_finish();
	printf("Completed format conversion\n");

	return 0;
}


