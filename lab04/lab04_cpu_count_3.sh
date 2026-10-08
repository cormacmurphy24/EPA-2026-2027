#!/bin/bash

usage() {
	echo "Usage: $(basename $0) [MAX_NUM_CORES]"
	exit 1
}

required=$1
if [ -z "$required" ]; then
	read -p "No number given. How many cores are needed? " required
fi

case $required in
	'' | *[!0-9]*)
		echo "Error: '$required' is not a valid number"
		usage
		;;
esac

# grep finds every "processor" line 
num_cpu=$(grep processor /proc/cpuinfo | wc -l)

num_nproc=$(nproc)

echo "CPU cores found using /proc/cpuinfo: $num_cpu"
echo "CPU cores found using nproc: $num_nproc"

# -lt means "less than"
if [ $num_cpu -lt $required ]; then
	echo "ERROR: this VM has $num_cpu cores but at least $required are needed"
	exit 1
else
	echo "OK: this VM has enough cores ($num_cpu >= $required)"
fi

echo ""
echo "read: asks the user to type in a value. It improves the script because"
echo "      if the user forgets the number, they can enter it instead of the script just stopping."
echo "case: compares a value against patterns. It improves the script because"
echo "      it rejects input that is not a whole number (like 'abc'), which used to crash the -lt test."
