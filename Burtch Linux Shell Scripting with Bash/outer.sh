#!/usr/bin/env bash

#outer.sh
declare -rx COMPANY_BRANCH="West Coast Branch"
bash inner.sh
printf "%s\n" "$COMPANY_BRANCH"
exit 0
