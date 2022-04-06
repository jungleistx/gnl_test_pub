#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>

int main(void)
{
    int fd, res;
	char *ptr;

    // unopened file
    fd = 42;
    res = get_next_line(fd, &ptr);
	if (res != -1)
    {
		printf("\n\033[0;31mERROR, get_next_line should return -1\033[0m\n");
        free(ptr);
        close(fd);
    }
    else
        printf("\n\033[0;32mUnopened fd\tOK!\n\033[0m");
    
    // file -1
    res = get_next_line(-1, &ptr);
	if (res != -1)
    {
		printf("\033[0;31mERROR, get_next_line should return -1\033[0m\n");
        free(ptr);
    }
    else
        printf("\033[0;32mfd -1\t\tOK!\033[0m\n");

    // null address + valid file
    fd = open("file1", O_RDONLY);
    if (fd == -1)
    {
        printf("\033[0;31mError on opening testfile, terminating\033[0m\n");
        return (0);
    }
    res = get_next_line(fd, 0x0);
    if (res != -1)
        printf("\033[0;31mERROR, get_next_line should return -1\033[0m\n\n");
    else
        printf("\033[0;32m!file\t\tOK!\033[0m\n\n");
}
