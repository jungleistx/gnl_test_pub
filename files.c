#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[])
{

	int fd;
	char *ptr;

	if (argc != 2)
	{
		printf("\033[0;33mUsage: run \033[0m%s\033[0;33m with \033[0mfilename\n", argv[0]);
		return (0);
	}
	fd = open(argv[1], O_RDONLY);
	if (fd == -1)
	{
		printf("\033[0;31mError opening '%s', terminating.\033[0m\n", argv[1]);
		return (0);
	}
	while (get_next_line(fd, &ptr) == 1)
	{
		printf("\033[0;34m'%s'\033[0m\n", ptr);
		free(ptr);
	}
	close(fd);
}
