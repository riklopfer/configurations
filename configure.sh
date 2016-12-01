#!/usr/bin/env bash
LOC=$(dirname $(readlink -f $0))

function do_configure() {
    if [ $1 ]; then
        CONFIG_DIR=$1

        echo 
        echo "Installing configurations from $CONFIG_DIR"
        echo 
        [ -f $CONFIG_DIR/pre_configure.sh ] && $CONFIG_DIR/pre_configure.sh
        [ -d $CONFIG_DIR/home ] && $LOC/helper/link_configs.sh $CONFIG_DIR/home
        [ -f $CONFIG_DIR/post_configure.sh ] && $CONFIG_DIR/post_configure.sh
    fi
}

ROOT_DIR=$LOC/resources/configure

# in case you want a collection of shared configurations
[ -d $ROOT_DIR/shared ] && do_configure $ROOT_DIR/shared

HOST_DIR=$ROOT_DIR/host/$HOSTNAME 
if ! [ -d $HOST_DIR ]; then 
    echo "No configurations for host: '$HOSTNAME'"
    exit 1
fi


do_configure $HOST_DIR