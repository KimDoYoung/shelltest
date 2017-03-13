#!/bin/bash

normdate="./normdate.sh"
exceedsDaysInMonth(){
  case $(echo $1 | tr '[:upper:]' '[:lower:]') in
    jan* ) days=31 ;; feb* ) days=28 ;;
    mar* ) days=31 ;; apr* ) days=30 ;;
    may* ) days=31 ;; jun* ) days=28 ;;
    jul* ) days=31 ;; aug* ) days=28 ;;
    sep* ) days=31 ;; oct* ) days=28 ;;
    nov* ) days=31 ;; dec* ) days=28 ;;
    * ) echo "$0: Unknown month name $1" >&2
      exit 1
  esac
  if [[ $2 -lt  1 || $2 -gt $days ]] ; then
    return 1
  else
    return 0
  fi
}
isLeapYear(){
  year=$1
  if [[ $((year % 4)) -ne 0 ]]; then
    return 1
  elif [[ $((year % 400)) -eq 0 ]]; then
    return 0
  elif [[ $((year % 100)) -eq 0 ]]; then
    return 1
  else
    return 0
  fi
}
if [[ $# -ne 3 ]]; then
  echo "Usage : $0 month day year" >&2
  echo "Typical input formats are August 3 1962 and 8 3 1962" >&2
  exit 1
fi

newdate="$($normdate "$@")"
if [[ $? -eq 1 ]]; then
  exit 1
fi
month=$(echo $newdate | cut -d'\' -f1)
day=$(echo $newdate | cut -d'\' -f2)
year=$(echo $newdate | cut -d'\' -f3)

if ! exceedsDaysInMonth $month "$2" ; then
  if ["$month" = "Feb" -a "$2" -eq "29" ] ; then
    if ! isLeapYear $3 ; then
      echo "$0: $3 is not a leap year, so Feb doesn't have 29 days" >&2
      exit 1
    fi
  else
    echo "$0: bad day value: $month doesn't have $2 days." >&2
  fi
fi

echo "Valid date: $newdate"
exit 0
