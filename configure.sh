#!/usr/bin/env bash
if ! source /etc/os-release 2> /dev/null; then
    echo "Cannot find /etc/os-release -- don't know how to proceed."
    exit 1
fi

LOC=$(dirname $(readlink -f $0))

if ! [ -d $LOC/$ID ]; then 
    echo "No configurations for OS: $ID"
    exit 1
fi
echo 
echo "Running configure script: $LOC/$ID/configure.sh"
echo 
exec $LOC/$ID/configure.sh