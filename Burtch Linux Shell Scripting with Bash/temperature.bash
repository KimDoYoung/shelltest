#!/usr/bin/env bash

#temperature.bash
shopt -s -o nounset

declare -i FTEMP
declare -i CTEMP

printf "%s\n" "Fahrenheit-Celsius Conversion"
printf "\n"

read -p "Enter a Fahrenheit temperature: " FTEMP

CTEMP="(5*(FTEMP-32))/9"
printf "The Celsius temperature is %d\n" "$CTEMP"

exit 0
