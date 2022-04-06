##! /bin/bash

REPO="/Users/rvuorenl/hive/backups/$1"
#REPO="/Users/rvuorenl/hive/evals/$1"
TEST="/Users/rvuorenl/hive/tests/gnl"
HEAD=$REPO/get_next_line.h
YE='\033[4;33m'
YEN='\033[1;33m'
GR='\033[0;32m'
PR='\033[1;35m'
BL='\033[0;34m'
RD='\033[0;31m'
NC='\033[0m'

declare -i x=0 BUFF=$2 LINE1 LINE2 RND=0

checkdiff() {
	if cmp -s -- $1 $2; then
		((x++))
	else
		if [ ! -f error_output ]; then
			printf "\t\t\tERRORS\n\n\tCat on left, gnl output on right\n\n" > error_output
		fi
		printf "Diff with input $3, BUF = $4 - " >> error_output
		diff -q $1 $2 >> error_output
		diff -y $1 $2 >> error_output
		printf "\n" >> error_output
	fi
}


cd $REPO
#make -C libft/ fclean            && make -C libft/
make -C libft/ fclean > /dev/null && make -C libft/ > /dev/null
cd $TEST

if (( $BUFF == 8)); then
printf "\n		      						 	${YEN}-------------------------------------${NC}\n"
printf "		      						 	${YEN}-------------------------------------${NC}\n"
printf "		      						 	${YEN}-------------------------------------${NC}\n"
fi

echo "\n\n${RD}_|___|___|___|___|___|___|___|___|___|___|___|___|___|___|_"
echo "___|___|___|___|___|___|___|___|___|___|___|___|___|___|___"
echo "_|___|___|___|___|___|___|___|___|___|___|___|___|___|___|_"
echo "__|___|${PR}  ____            _______       ____      ${RD}__|___|___  ${GR} ^ ^${RD}"
echo "___|__ ${PR} /           |       |    ___  /___   ___  ${RD}___|___|_  ${GR}(O,O)${RD}"
echo "|___|_${PR} |   __  |\ | |       |    |_       \   |   ${RD}_|__|___|  ${GR}(   )${RD}"
echo "_|___|_${PR} \__/ |.| \|.|___    |    |__  |___/   |   ${RD}__|___|__  ${GR}-"-"----${RD}"
echo "__|___|_					_|___|___|_"
echo "___|___|___|___|___|___|___|___|___|___|___|___|___|___|___"
echo "|___|___|___|___|___|___|___|___|___|___|___|___|___|___|__"
echo "_|___|___|___|___|___|___|___|___|___|___|___|___|___|___|_${NC}\n"
echo "			   ${YEN}||${NC}"
echo "			   ${YEN}||${NC}"
if (( $BUFF == 8)); then
printf "\n		      ${BL}ROUND 1 / 4\n		      BUFF = $BUFF${NC}\n"
fi
if (( $BUFF == 1)); then
printf "\n		      ${BL}ROUND 2 / 4\n		      BUFF = $BUFF${NC}\n"
fi
if (( $BUFF == 1000)); then
printf "\n		      ${BL}ROUND 3 / 4\n		      BUFF = $BUFF${NC}\n"
fi
if (( $BUFF == 4096)); then
printf "\n		      ${BL}ROUND 4 / 4\n		      BUFF = $BUFF${NC}\n"
fi
echo "			   ${YEN}||${NC}"
echo "			   ${YEN}||${NC}\n"

#x = test output, BUFF = BUFF, LINE1 = line containing buff_size, LINE2 is where to write
#RND = round script is run

#HEAD=$REPO/get_next_line.h

# gives nr of lines
LINE1=$(sed -n '/# define BUFF_SIZE /=' $HEAD)
NEWBUFF="# define BUFF_SIZE $BUFF"

sed -e "${LINE1}s/.*/$NEWBUFF/" $HEAD > $HEAD.tmp
mv $HEAD.tmp $HEAD

echo "#include \"$REPO/get_next_line.h\"" > tmpstdout.c
cat stdout_copy.c >> tmpstdout.c
clang -Wall -Wextra -Werror $REPO/get_next_line.c tmpstdout.c -o stdout \
   	-I $REPO/libft/includes -L $REPO/libft -lft

echo "#include \"$REPO/get_next_line.h\"" > tmpstdout2.c
cat stdout_nl.c >> tmpstdout2.c
clang -Wall -Wextra -Werror $REPO/get_next_line.c tmpstdout2.c -o stdout2 \
   	-I $REPO/libft/includes -L $REPO/libft -lft

echo "#include \"$REPO/get_next_line.h\"" > tmpfiles.c
cat files_copy.c >> tmpfiles.c
clang -Wall -Wextra -Werror $REPO/get_next_line.c tmpfiles.c -o files \
   	-I $REPO/libft/includes -L $REPO/libft -lft

echo "#include \"$REPO/get_next_line.h\"" > tmpfiles2.c
cat files_nl.c >> tmpfiles2.c
clang -Wall -Wextra -Werror $REPO/get_next_line.c tmpfiles2.c -o files2 \
   	-I $REPO/libft/includes -L $REPO/libft -lft

echo "#include \"$REPO/get_next_line.h\"" > tmpmulti.c
cat multi.c >> tmpmulti.c
clang -Wall -Wextra -Werror $REPO/get_next_line.c tmpmulti.c -o multi \
   	-I $REPO/libft/includes -L $REPO/libft -lft

echo "#include \"$REPO/get_next_line.h\"" > tmperror.c
cat error.c >> tmperror.c
clang -Wall -Wextra -Werror $REPO/get_next_line.c tmperror.c -o error \
   	-I $REPO/libft/includes -L $REPO/libft -lft

echo  "		${YE}--------- BASIC TESTS ---------${NC}\n"
echo  "	Testing stdout, 8 chars"

#basic stdout
cat 17 | ./stdout 17 && checkdiff 17 c_17 stdout $BUFF
cat 18 | ./stdout 18 && checkdiff 18 c_18 stdout $BUFF
cat 19 | ./stdout 19 && checkdiff 19 c_19 stdout $BUFF
cat 27 | ./stdout 27 && checkdiff 27 c_27 stdout $BUFF
cat 28 | ./stdout 28 && checkdiff 28 c_28 stdout $BUFF
cat 29 | ./stdout 29 && checkdiff 29 c_29 stdout $BUFF
cat 47 | ./stdout 47 && checkdiff 47 c_47 stdout $BUFF
cat 48 | ./stdout 48 && checkdiff 48 c_48 stdout $BUFF
rm *c_* tmpstdout.c

if (( $x < 8)); then
	printf "${RD}ERROR, $x/8 passed!${NC}\n"
else
	printf "${GR}$x/$x OK!${NC}\n"
fi
x=0

#basic files
echo  "	Testing with files, 8 chars${NC}"
./files 17 && checkdiff 17 c_17 files $BUFF
./files 18 && checkdiff 18 c_18 files $BUFF
./files 19 && checkdiff 19 c_19 files $BUFF
./files 27 && checkdiff 27 c_27 files $BUFF
./files 28 && checkdiff 28 c_28 files $BUFF
./files 29 && checkdiff 29 c_29 files $BUFF
./files 47 && checkdiff 47 c_47 files $BUFF
./files 48 && checkdiff 48 c_48 files $BUFF
rm *c_* tmpfiles.c

if (( $x < 8)); then
	printf "${RD}ERROR, $x/8 passed!${NC}\n"
else
	printf "${GR}$x/$x OK!${NC}\n"
fi
x=0

#middle files
echo  "		${YE}--------- MIDDLE TESTS ---------${NC}\n"
echo  "	Testing with files, 16 chars"
./files 115 && checkdiff 115 c_115 files $BUFF
./files 116 && checkdiff 116 c_116 files $BUFF
./files 117 && checkdiff 117 c_117 files $BUFF
./files 215 && checkdiff 215 c_215 files $BUFF
./files 216 && checkdiff 216 c_216 files $BUFF
./files 217 && checkdiff 217 c_217 files $BUFF
./files 415 && checkdiff 415 c_415 files $BUFF
./files 416 && checkdiff 416 c_416 files $BUFF
rm *c_*

if (( $x < 8)); then
	printf "${RD}ERROR, $x/8 passed!${NC}\n"
else
	printf "${GR}$x/$x OK!${NC}\n"
fi
x=0

#middle stdout
echo  "	Testing with stdout, 16 chars"
cat 115 | ./stdout 115 && checkdiff 115 c_115 stdout $BUFF
cat 116 | ./stdout 116 && checkdiff 116 c_116 stdout $BUFF
cat 117 | ./stdout 117 && checkdiff 117 c_117 stdout $BUFF
cat 215 | ./stdout 215 && checkdiff 215 c_215 stdout $BUFF
cat 216 | ./stdout 216 && checkdiff 216 c_216 stdout $BUFF
cat 217 | ./stdout 217 && checkdiff 217 c_217 stdout $BUFF
cat 415 | ./stdout 415 && checkdiff 415 c_415 stdout $BUFF
cat 416 | ./stdout 416 && checkdiff 416 c_416 stdout $BUFF
rm *c_*

if (( $x < 8)); then
	printf "${RD}ERROR, $x/8 passed!${NC}\n"
else
	printf "${GR}$x/$x OK!${NC}\n"
fi
x=0

#advanced files
echo  "		${YE}--------- ADVANCED TESTS ---------${NC}n"
echo  "	Testing with files, 4 chars"
./files 14 && checkdiff 14 c_14 files $BUFF
./files 23 && checkdiff 23 c_23 files $BUFF
./files 24 && checkdiff 24 c_24 files $BUFF
./files 25 && checkdiff 25 c_25 files $BUFF
./files 43 && checkdiff 43 c_43 files $BUFF
./files 44 && checkdiff 44 c_44 files $BUFF
rm *c_*

if (( $x < 6)); then
	printf "${RD}ERROR, $x/6 passed!${NC}\n"
else
	printf "${GR}$x/$x OK!${NC}\n"
fi
x=0

#advanced stdout
echo  "	Testing with stdout, 4 chars"
cat 14 | ./stdout 14 && checkdiff 14 c_14 stdout $BUFF
cat 23 | ./stdout 23 && checkdiff 23 c_23 stdout $BUFF
cat 24 | ./stdout 24 && checkdiff 24 c_24 stdout $BUFF
cat 25 | ./stdout 25 && checkdiff 25 c_25 stdout $BUFF
cat 43 | ./stdout 43 && checkdiff 43 c_43 stdout $BUFF
cat 44 | ./stdout 44 && checkdiff 44 c_44 stdout $BUFF
rm *c_*

if (( $x < 6)); then
	printf "${RD}ERROR, $x/6 passed!${NC}\n"
else
	printf "${GR}$x/$x OK!${NC}\n"
fi
x=0

#files no newlines
echo  "	Testing with no newline"
./files2 one4 && checkdiff one4 c_one4  NoNew_file $BUFF
./files2 one8 && checkdiff one8 c_one8  NoNew_file $BUFF
./files2 one16 && checkdiff one16 c_one16  NoNew_file $BUFF
./files2 nl && checkdiff nl c_nl  NoNew_file $BUFF
rm *c_*

if (( $x < 4)); then
	printf "${RD}ERROR, $x/4 passed!${NC}\n"
else
	printf "${GR}$x/$x OK!${NC}\n"
fi
x=0

#stdout no newlines
echo  "	Testing stdout with no newline"
cat one4 | ./stdout2 one4 && checkdiff one4 c_one4 Nonew_stdout $BUFF
cat one8 | ./stdout2 one8 && checkdiff one8 c_one8 NoNew_stdout $BUFF
cat one16 | ./stdout2 one16 && checkdiff one16 c_one16 NoNew_stdout $BUFF
cat nl | ./stdout2 nl && checkdiff nl c_nl NoNew_stdout $BUFF
rm *c_*

if (( $x < 4)); then
	printf "${RD}ERROR, $x/4 passed!${NC}\n"
else
	printf "${GR}$x/$x OK!${NC}\n"
fi
x=0

echo  "		${YE}--------- ERROR MANAGEMENT ---------${NC}"
./error

echo  "		${YE}--------- BONUS ---------${NC}\n"
./multi && checkdiff multi_output c_multi multiple $BUFF

if (( $x < 1)); then
	printf "${RD}ERROR WITH MULTIPLE FILES${NC}\n"
else
	printf "${GR}MULTIPLE FILES OK!${NC}\n"
fi

rm *c_* *tmp* error files files2 stdout stdout2 multi

if (( $BUFF != 4096 ))
then
	if (( $BUFF == 8))
	then
		./testmain.sh $1 1
	fi
	if (( $BUFF == 1 ))
	then
		./testmain.sh $1 1000
	fi
	if (( $BUFF == 1000 ))
	then
		./testmain.sh $1 4096
	fi
fi

echo
cd $REPO/libft
make fclean > /dev/null
cd ..
if (( $BUFF == 4096))
then
	echo  "		${YE}--------- NORM ---------${NC}\n"
	#Norminette get_next_line.c get_next_line.h
 	Norminette

# fi
# <<com
	echo  "\n		${YE}--------- LEAKS ---------${NC}\n"

	make -C libft/ fclean > /dev/null && make -C libft/ > /dev/null
	cd $TEST

	LINE1=$(sed -n '/# define BUFF_SIZE /=' $HEAD)
	NEWBUFF="# define BUFF_SIZE 1"

	sed -e "${LINE1}s/.*/$NEWBUFF/" $HEAD > $HEAD.tmp
	mv $HEAD.tmp $HEAD

	echo "#include \"$REPO/get_next_line.h\"" > tmpleaks.c
	cat leaks.c >> tmpleaks.c
	clang -Wall -Wextra -Werror $REPO/get_next_line.c tmpleaks.c -o leaks \
   	-I $REPO/libft/includes -L $REPO/libft -lft

	if leaks -atExit -- ./leaks > /dev/null
	then
		printf "${GR}LEAKS OK!${NC}\n"
	else
		printf "${RD}ERROR, LEAK(S) FOUND!${NC}}\n"
		if [ ! -f error_output ]
		then
			printf "\t\t\tERRORS\n\n\t\tLEAKS OUTPUT\n\n" > error_output
			leaks -atExit -- ./leaks >> error_output
		else
			printf "\n\t\tLEAKS OUTPUT\n\n" >> error_output
			leaks -atExit -- ./leaks >> error_output
		fi
	fi
	rm leaks tmpleaks.c
fi
# com

