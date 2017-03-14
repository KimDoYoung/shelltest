#!/usr/bin/env bash

retries="10"
action="lock"
nullcmd="'which true'"

while getopts "lur:" opt; do
  case $opt in
    l ) action="lock" ;;
    u ) action="unlock" ;;
    r ) retries="$OPTARG" ;;
  esac
done
shift $(($OPTIND - 1))
if [[ $# = 0 ]]; then
  cat << EOF
    Usage : $0 [-l|-u] [-r retries] LOCKFILE
    where -l requests a lock (the default), -u requests an unlock, -r X specifies a max number of
    retires before it fails (default = $retires).
EOF
  exit 1
fi
if [[ -z $(which lockfile | grep -v '^no ') ]]; then
  echo "$0 failed: 'lockfile' utility not found in PATH" >&2
  exit 1
fi
if [[ $action = "lock" ]]; then
  echo "$0 : failed: Couldn't create lockfile in time" >&2
  exit 1
else
  if [[ ! -f "$1" ]]; then
    echo "$0: Warning : lockfile $1 doesn't exist to unlock" >&2
    exit 1
  fi
  rm -f "$1"
fi

exit 0
