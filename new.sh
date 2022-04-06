#var="testing"
#sed -i -e "2i${var}" file4 > newfile
#declare -i x=2
#declare -i y=$x+1

##{ head -n $x file4; echo ${var}; tail -n +$y file4; }

#grep -rnw ./file4 -e 'F4 - longer'
#awk 'NR==2' file4
#sed -n '/\<# define BUFF_SIZE 8\>/=' ~/repos/get_next_line/get_next_line.h 
#awk '/\<# define BUFF_SIZE 8\>/{print NR}' ~/repos/get_next_line/get_next_line.h 
#sed -n '/F4/=' file4


#NEWVAR=$(sed -n '/# define BUFF_SIZE /=' ~/repos/get_next_line/get_next_line.h)
#echo $NEWVAR


#declare -i LINE1 LINE2
#declare -i LINE2
# line 16 = # define BUFF_SIZE 8
#insert line 17

# gives nr of lines
#LINE1=$(sed -n '/# define BUFF_SIZE /=' ./tmpheader.h)
#((LINE1--))
#LINE2=$LINE1+2
#NEWBUFF="# define BUFF_SIZE $BUFF"

#insert at line
##{ head -n $LINE1 ~/repos/get_next_line/get_next_line.h; 
#echo ${NEWBUFF}; tail -n +$LINE2 ~/repos/get_next_line/get_next_line.h; } > tttheader.h

#sed -i -e 's:# define BUFF_SIZE :// #define BUFF_SIZE :' ./tttheader.h
VAR=newheader.h

declare -i BUFF=$1 LINE1 LINE2
NEWBUFF="# define BUFF_SIZE $BUFF"
LINE1=$(sed -n '/# define BUFF_SIZE /=' newheader.h)
#sed -e "${LINE1}s/.*/$NEWBUFF/" newheader.h > newheader.h.tmp
#mv newheader.h.tmp newheader.h
sed -e "${LINE1}s/.*/$NEWBUFF/" $VAR > $VAR.tmp
mv $VAR.tmp $VAR

#make new header, replace with own define
LINE1=$(sed -n '/# define BUFF_SIZE /=' $REPO/get_next_line.h)
((LINE1--))
LINE2=$LINE1+2
NEWBUFF="# define BUFF_SIZE $BUFF"
{ head -n $LINE1 $REPO/get_next_line.h; echo ${NEWBUFF}; 
tail -n +$LINE2 $REPO/get_next_line.h; } > newheader.h