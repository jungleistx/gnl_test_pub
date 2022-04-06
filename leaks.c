#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>

int main(void)
{
    int fd;
    char *ptr;

    fd = open("28", O_RDONLY);
    if (fd == -1)
    {
        printf("\033[0;31mError opening file '28' during leaks, terminating.\033[0m\n");
        return (0);
    }
    while (get_next_line(fd, &ptr) == 1)
        free(ptr);
    close(fd);
    return (0);
}
