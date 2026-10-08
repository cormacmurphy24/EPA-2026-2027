#!/bin/bash

usage() {
	echo "Usage: $(basename $0) [MAX_NUM_CORES]"
	exit 1
}

# -z checks if $1 is empty 
if [ -z $1 ]; then
	usage
fi

# grep finds every "processor" line
num_cpu=$(grep processor /proc/cpuinfo | wc -l)

num_nproc=$(nproc)

echo "CPU cores found using /proc/cpuinfo: $num_cpu"
echo "CPU cores found using nproc: $num_nproc"

# -lt means "less than"
if [ $num_cpu -lt $1 ]; then
	echo "ERROR: this VM has $num_cpu cores but at least $1 are needed"
	exit 1
else
	echo "OK: this VM has enough cores ($num_cpu >= $1)"
fi
