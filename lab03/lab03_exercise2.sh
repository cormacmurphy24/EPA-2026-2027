#!/bin/bash

# this is a comment

# for loop to count to 10
for c in {1..5}; do
	echo "$(date): Count: $c" >> lab03.log

	# if does not use == it uses -eq
	# note the spaces around if [ ]
	if [ $c -eq 3 ]; then
		echo "$(date): found the third item" >> lab03.log
	fi
done

if [ -z $1 ]; then
	echo "$(date): You didn't pass any parameters to $0" >> lab03.log
	exit 1
else
	echo "$(date): You passed in $1 to $0" >> lab03.log
fi

ct=$(ps -ef | wc -l)
echo "$(date): There are $ct processes running on this machine" >> lab03.log

if [ $ct -gt $1 ]; then
	echo "$(date): Maximum number of processes exceeded" >> lab03.log
else
	echo "$(date): The maximum number of processes NOT exceeded" >> lab03.log
fi
