#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[])
{

	int fd, fdw;
	char *ptr, new[9] = "c_";

	if (argc != 2)
	{
		printf("\033[0;33mUsage: run \033[0m%s\033[0;33m with \033[0mfilename\n", argv[0]);
		return (0);
	}
	ft_strcat(new, argv[1]);
	fdw = open(new, O_CREAT | O_WRONLY, 0700);
	fd = open(argv[1], O_RDONLY);
	if (fd == -1 || fdw == -1)
	{
		printf("\033[0;31mError opening '%s', terminating.\033[0m\n", argv[1]);
		return (0);
	}
	while (get_next_line(fd, &ptr) == 1)
	{
		if (ft_strlen(ptr) == 0)
			write(fdw, "\n", 1);
		write(fdw, ptr, ft_strlen(ptr));
		free(ptr);
	}
	close(fd);
	close(fdw);
}
