#include <stdio.h>

int main(int argc, char *argv[])
{
	for (int i = 0; i<256; i++){
	printf("\033[38;5;%imHello, World!\n", i);
	}
	return 0;
}

