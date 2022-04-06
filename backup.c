#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>

int	get_next_line(const int fd, char **line);

int main(int argc, char *argv[])
{
    char *ptr;
    int fd;

    if (argc != 2)
        return (0);
    
    fd = open(argv[1], O_RDONLY);
    if (fd == -1)
    {
        printf("Error on opening, terminating...\n");
        return (0);
    }

    while (get_next_line(fd, &ptr) == 1)
    {
        printf("'%s'\n", ptr);
        free(ptr);
    }

    close(fd);
    return (0);
}
