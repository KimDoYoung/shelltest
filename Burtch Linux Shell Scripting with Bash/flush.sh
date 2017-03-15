#!/bin/bash
#
# Flus disks if nobody is on the computer
#
# Author
#
shopt -s -o nounset

# Global Declarations
declare -rx SCRIPT=${0##*/}
declare -rx who="/usr/bin/who"
declare -rx sync="/bin/sync"
declare -rx wc="/usr/bin/wc"

#Sanity checks
if [[ -z "$BASH" ]]; then
  printf "$SCRIPT:$LINENO : please run this script with the BASH shell\n" >&2
  exit 192
fi
if  [[ ! -x $who ]]; then
  printf "$SCRIPT:$LINENO : the command $who is not available - aborting\n" >&2
  exit 192
fi
if ! [[ -x "$sync" ]]; then
  printf "$SCRIPT:$LINENO : the command $sync is not available - aborting\n" >&2
  exit 192
fi
if ! [[ -x "$wc" ]]; then
  printf "$SCRIPT:$LINENO : the command $wc is not available - aborting\n" >&2
  exit 192
fi

# Flush disks if nobody is on the computer

USERS=`$who | wc -l`
if [[ $USERS -eq 0 ]]; then
  $sync
fi

#clean up
exit 0
