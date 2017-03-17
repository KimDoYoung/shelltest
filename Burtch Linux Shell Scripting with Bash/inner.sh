#inner.sh

printf "This is the inner script.\n"

declare -p COMPANY_BRANCH
COMPANY_BRANCH="East Coast Branch"
printf "%s\n" "$COMPANY_BRANCH"
printf "Inner script finished\n"

exit 0
