#!/bin/bash

mode=$2

output() {
	if [ "$mode" = "file" ]; then
		echo "$(date): $1" >> lab03.log
	else
		echo "$1"
	fi
}

for c in {1..5}; do
	output "Count: $c"

	if [ $c -eq 3 ]; then
		output "found the third item"
	fi
done

if [ -z $1 ]; then
	echo "You didn't pass any parameters to $0"
	exit 1
else
	output "You passed in $1 to $0"
fi

ct=$(ps -ef | wc -l)
output "There are $ct processes running on this machine"

if [ $ct -gt $1 ]; then
	output "Maximum number of processes exceeded"
else
	output "The maximum number of processes NOT exceeded"
fi
