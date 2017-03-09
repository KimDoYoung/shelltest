#!/bin/bash
echo "\$* 와 \$@"
#
#변수의 선언
#
MYSTRING=abc

# if 의 사용예1
if [ $MYSTRING = abc ] ; then
 	echo "$MYSTRING is  abc";
fi

# if 의 사용예2
filename="$HOME"

if [ -e $filename ] ; then echo "$filename exists"; fi

if [ -f $filename ] ; then
	echo "$filename is a regular file"
elif [ -d $filename ] ; then
	echo "$filename is a directory"
else
	echo "i have no idea what $filename is "
fi
# for의 사용예1
for NUMBER in 0 1 2 3 4 5
do
	echo The number is $NUMBER
done

# for의 사용예2
for FILE in `/bin/ls`; do echo $FILE; done

# while의 사용예
VAR=0
while [ $VAR -lt  3 ]
do
	echo $VAR
	VAR=$(($VAR + 1)) # 산술연산 $(( ))
done
