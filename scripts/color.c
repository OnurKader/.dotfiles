#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv)
{
	if(argc < 3)
	{
		fprintf(stderr, "\033[31;1m\tInvalid Argument Count!\n");
		return 1;
	}

	int i = 0;
	if(argc > 4)
	{
		int r = atoi(argv[1]);
		int g = atoi(argv[2]);
		int b = atoi(argv[3]);
		printf("\033[38;2;%d;%d;%dm", r, g, b);
		i = 4;
	}
	else if(argc > 2)
	{
		int r = atoi(argv[1]);
		printf("\033[38;2;%d;%d;%dm", r, r, r);
		i = 2;
	}

	for(; i < argc; ++i)
		if(i == argc - 1)
			printf("%s", argv[i]);
		else
			printf("%s ", argv[i]);

	return 0;
}
