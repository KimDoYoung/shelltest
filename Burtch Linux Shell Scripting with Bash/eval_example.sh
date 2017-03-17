#eval_example.sh

shopt -s -o nounset

declare -r DISPLAY_VARIABLES='$SALES_EAST'
declare -i SALES_EAST=1000
declare -i SALES_WEST=2000
declare -i SALES_NORTH=3000

printf "DISPLAY_VARIABLES = %s\n" "$DISPLAY_VARIABLES"
printf "reprocessed with eval, DISPLAY_VARIABLES = %s\n" `eval printf "%s\n" $SALES_EAST`
