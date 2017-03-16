#!/bin/bash
declare -a predefined=( "BASH" "BASH_ENV"
BASH_VERSION
COLUMNS
FUNCNAME
HOSTNAME
HOSTTYPE
HOSTNAMEIFS
LINENO
LINES
OSTYPE
PATH
PPID
PROMPT_COMMAND
PS1
PS2
PS3
PS4
PWD
RANDOM
SHELL
TERM
DISPLAY
EDITOR
ORGANIZTION
VISUAL
WINDOWMANAGER
)
for item in ${predefined[@]}
do
  printf "%s:%s\n" ${item} ${!item} 
done
