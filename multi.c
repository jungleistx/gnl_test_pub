#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>

int main(void)
{

	int fd1, fd2, fd3, fd4, fdw;
	char *ptr, *new = "c_multi";

	fd1 = open("file1", O_RDONLY);
    fd2 = open("file2", O_RDONLY);
    fd3 = open("file3", O_RDONLY);
    fd4 = open("file4", O_RDONLY);
	fdw = open(new, O_CREAT | O_WRONLY, 0700);
	if (fd1 == -1)
	{
		printf("\n\033[0;31mError opening 'file1', terminating\033[0m\n");
		return (0);
	}
    if (fd2 == -1)
	{
		printf("\n\033[0;31mError opening 'file2', terminating\033[0m\n");
		return (0);
	}
    if (fd3 == -1)
	{
		printf("\n\033[0;31mError opening 'file3', terminating\033[0m\n");
		return (0);
	}
    if (fd4 == -1)
	{
		printf("\n\033[0;31mError opening 'file4', terminating\033[0m\n");
		return (0);
	}
    if (fd4 == -1)
	{
		printf("\n\033[0;31mError opening 'c_multi', terminating\033[0m\n");
		return (0);
	}
 
    get_next_line(fd1, &ptr);
    {
        write(fdw, ptr, ft_strlen(ptr));
        write(fdw, "\n", 1);
        free(ptr);
    }
    get_next_line(fd1, &ptr);
    {
        write(fdw, ptr, ft_strlen(ptr));
        write(fdw, "\n", 1);
        free(ptr);
    }
    get_next_line(fd2, &ptr);
    {
        write(fdw, ptr, ft_strlen(ptr));
        write(fdw, "\n", 1);
        free(ptr);
    }
    get_next_line(fd3, &ptr);
    {
        write(fdw, ptr, ft_strlen(ptr));
        write(fdw, "\n", 1);
        free(ptr);
    }
    get_next_line(fd2, &ptr);
    {
        write(fdw, ptr, ft_strlen(ptr));
        write(fdw, "\n", 1);
        free(ptr);
    }
    get_next_line(fd4, &ptr);
    {
        write(fdw, ptr, ft_strlen(ptr));
        write(fdw, "\n", 1);
        free(ptr);
    }
    get_next_line(fd3, &ptr);
    {
        write(fdw, ptr, ft_strlen(ptr));
        write(fdw, "\n", 1);
        free(ptr);
    }
    get_next_line(fd4, &ptr);
    {
        write(fdw, ptr, ft_strlen(ptr));
        write(fdw, "\n", 1);
        free(ptr);
    }
    get_next_line(fd3, &ptr);
    {
        write(fdw, ptr, ft_strlen(ptr));
        write(fdw, "\n", 1);
        free(ptr);
    }
    get_next_line(fd4, &ptr);
    {
        write(fdw, ptr, ft_strlen(ptr));
        write(fdw, "\n", 1);
        free(ptr);
    }
    get_next_line(fd2, &ptr);
    {
        write(fdw, ptr, ft_strlen(ptr));
        write(fdw, "\n", 1);
        free(ptr);
    }
    get_next_line(fd1, &ptr);
    {
        write(fdw, ptr, ft_strlen(ptr));
        write(fdw, "\n", 1);
        free(ptr);
    }

    /*
    printf("\n\t\"expected: \033[0;34m1\033[0m \033[0;34m1\033[0m \033[0;32m2\033[0m \033[0;31m3\033[0m\"\n\n");
    get_next_line(fd1, &ptr);
    printf("\033[0;34m'%s'\033[0m\n", ptr);
    free(ptr);
    get_next_line(fd1, &ptr);
    printf("\033[0;34m'%s'\033[0m\n", ptr);
    free(ptr);
    get_next_line(fd2, &ptr);
    printf("\033[0;32m'%s'\033[0m\n", ptr);
    free(ptr);
    get_next_line(fd3, &ptr);
    printf("\033[0;31m'%s'\033[0m\n", ptr);
    free(ptr);
    printf("\n\t\"expected: \033[0;32m2\033[0m 4 \033[0;31m3\033[0m 4\"\n\n");
    get_next_line(fd2, &ptr);
    printf("\033[0;32m'%s'\033[0m\n", ptr);
    free(ptr);
    get_next_line(fd4, &ptr);
    printf("'%s'\n", ptr);
    free(ptr);
    get_next_line(fd3, &ptr);
    printf("\033[0;31m'%s'\033[0m\n", ptr);
    free(ptr);
    get_next_line(fd4, &ptr);
    printf("'%s'\n", ptr);
    free(ptr);
    printf("\n\t\"expected: \033[0;31m3\033[0m 4 \033[0;32m2\033[0m \033[0;34m1\033[0m\"\n\n");
    get_next_line(fd3, &ptr);
    printf("\033[0;31m'%s'\033[0m\n", ptr);
    free(ptr);
    get_next_line(fd4, &ptr);
    printf("'%s'\n", ptr);
    free(ptr);
    get_next_line(fd2, &ptr);
    printf("\033[0;32m'%s'\033[0m\n", ptr);
    free(ptr);
    get_next_line(fd1, &ptr);
    printf("\033[0;34m'%s'\033[0m\n", ptr);
    free(ptr);
    */
	close(fd1);
    close(fd2);
    close(fd3);
    close(fd4);
    close(fdw);
}
