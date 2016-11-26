#!/usr/bin/env bash
LOC=$(dirname $(readlink -f $0))

function configure_id() {
    if [ $1 ]; then
        ID=$1

        echo 
        echo "Running $ID configuration"
        echo 
        [ -f $LOC/$ID/pre_configure.sh ] && $LOC/$ID/pre_configure.sh
        [ -d $LOC/$ID/home ] && $LOC/helper/link_configs.sh $LOC/$ID/home
        [ -f $LOC/$ID/post_configure.sh ] && $LOC/$ID/post_configure.sh
    fi
}

configure_id shared

if ! source /etc/os-release 2> /dev/null; then
    echo "Cannot find /etc/os-release -- don't know how to proceed."
    exit 1
fi

if ! [ -d $LOC/$ID ]; then 
    echo "No configurations for OS: $ID"
    exit 1
fi


configure_id $ID