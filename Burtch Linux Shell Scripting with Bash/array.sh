#!/usr/bin/env bash
a[0]="1"
a[1]="2"
a[2]="3"
echo ${a[1]}

declare -a unix=('debian' 'red hat' 'ubuntu' 'mint')
echo ${unix[1]}
echo ${unix[@]} # @ mean all element
echo "length : ${#unix[@]}"
subunix=${unix[@]:1:2}
echo ${subunix[@]}
newunix=("${unix[@]}" "AIX" "HP-UX")
echo ${newunix[@]}
unset newunix[1]
echo ${newunix[@]}
#remove bash array elements using patterns
declare -a patter=( ${unix[@]/red*/} )
echo ${patter[@]}
#copy array
unix2=(${unix[@]})
echo ${unix2[@]}
#all unset
unix3=(${unix[@]} ${unix2[@]})
echo ${unix3[@]}
unset unix3
