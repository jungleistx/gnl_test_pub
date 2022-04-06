#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>


int main(void)
{
	char *ptr;

	while (get_next_line(0, &ptr) == 1)
	{
		printf("\033[0;34m'%s'\033[0m\n", ptr);
		free(ptr);
	}
}
