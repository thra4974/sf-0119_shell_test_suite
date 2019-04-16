#!/bin/bash
#
# simple test with exit to check for Illegal exit status (exceeing INT_MAX)

command="exit 2147483648"
tmp_file="checker_tmp_file_$RANDOM"
save_file=`echo $BASH_SOURCE | sed -e 's/\.\///g' -e 's/\//#/g'`

# clean up
stop_shell
rm -f $tmp_file

# create a pseudo random file
touch $tmp_file
# send commands
echo "$command" | $SHELL 2> $OUTPUTFILE &

# wait a little bit
$SLEEP $SLEEPSECONDS

# copy saved output for debugging
cat $OUTPUTFILE > "$SAVEOUTPUTDIR/$save_file"

# check the result
nmatch=`cat $OUTPUTFILE | grep -c ": 1: exit: Illegal number: 2147483648"`
if [ $nmatch -eq 1 ]; then
	   print_ok
else
	   print_ko
fi

# clean up
stop_shell
rm -f $tmp_file