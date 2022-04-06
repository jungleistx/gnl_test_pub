#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>


int main(int argc, char *argv[])
{
	char *ptr, new[9] = "c_";
	int fd;

	if (argc != 2)
	{
		printf("Error on test, terminating...");
		return (0);
	}
	ft_strcat(new, argv[1]);
	fd = open(new, O_CREAT | O_WRONLY, 0700);
	if (fd == -1)
	{
		printf("Error on testfile, terminating...");
		return (0);
	}
	while (get_next_line(0, &ptr) == 1)
	{
		write(fd, ptr, ft_strlen(ptr));
		write(fd, "\n", 1);
		free(ptr);
	}
	close(fd);
}
