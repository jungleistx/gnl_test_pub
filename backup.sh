##! /bin/bash

REPO="/Users/rvuorenl/evals/$1"
#REPO="/Users/rvuorenl/backups/get_next_line"
HEAD="$REPO/get_next_line.h"
TEST="/Users/rvuorenl/tests/gnl"

cd $REPO
make -C libft/ fclean > /dev/null && make -C libft/ > /dev/null
cd $TEST

clang -Wall -Wextra -Werror $REPO/get_next_line.c backup.c -o tmpbackup \
   	-I $REPO/libft/includes -L $REPO/libft -lft

./tmpbackup $2

rm tmpbackup 
cd $REPO/libft
make fclean > /dev/null
