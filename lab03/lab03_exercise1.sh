#!/bin/bash

# this is a comment

# for loop to count to 10
for c in {1..5}; do
	echo "Count: $c"

	# if does not use == it uses -eq
	# note the spaces around if [ ]
	if [ $c -eq 3 ]; then
		echo "found the third item"
	fi
done

if [ -z $1 ]; then
	echo "You didn't pass any parameters to $0"
	exit 1
else
	echo "You passed in $1 to $0"
fi

ct=$(ps -ef | wc -l)
echo "There are $ct processes running on this machine"

if [ $ct -gt $1 ]; then
	echo "Maximum number of processes exceeded"
else
	echo "The maximum number of processes NOT exceeded"
fi
