#!/bin/bash
validint(){
  number="$1"; min="$2"; max="$3"
  if [[ -z $number ]]; then
    echo "You didn't enter anthing. Please enter a number."
    return 1
  fi

  if [[ "${number%${number#?}}" = "-" ]]; then
    testvalue="${number#?}"
  else
    testvalue="$number"
  fi
  nodigits="$(echo $testvalue | sed 's/[[:digit:]]//g')"
  if [[ ! -z $nodigits ]]; then
    echo "Invalid number format! Only digits, no commas, spaces, etc." >&2
    return 1
  fi

  if [[ ! -z $min && $number -lt $min ]]; then
      echo "Your value is too small: smallest acceptable valud is $min" >&2
      return 1
  fi
  if [[ ! -z $max && $number -gt $max ]]; then
      echo "Your value is too big: largest acceptable valud is $max" >&2
      return 1
  fi
  return 0
}
if validint "$1" "$2" "$3" ; then
  echo "Input is a valid integer within your constraint"
fi
