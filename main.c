#include <stdio.h>

enum{PROG, ARGC};

int main(int argc, char *argv[])
{
	printf("Hello World!\n");
	printf("%i\n", ARGC);
	return 0;
}
