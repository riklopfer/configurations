#!/usr/bin/env bash
while getopts "y" opt; do
  case $opt in
    y)
      DASH_Y=-y
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

if ! source /etc/os-release 2> /dev/null; then
    echo "Cannot find /etc/os-release -- don't know how to proceed."
    exit 1
fi

LOC=$(dirname $(readlink -f $0))

if ! [ -d $LOC/$ID ]; then 
    echo "No install script for OS: $ID"
    exit 1
fi
echo 
echo "Running install script: $LOC/$ID/install.sh $DASH_Y"
echo 
exec $LOC/$ID/install.sh $DASH_Y