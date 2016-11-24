#!/usr/bin/env bash
if ! [ $1 ]; then
    echo "USAGE: link_configs <CONFIG_DIR>"
    exit 1
fi

CONFIG_DIR=$1
if ! [ -d ${CONFIG_DIR} ]; then
    echo "Not a directory: ${CONFIG_DIR}"
    exit 1
fi

function backup() {
    FILE=$1
    [ $FILE ] && [ -f $FILE ] && ! [ -L $FILE ] && mv $FILE $FILE.bak
}

for TARGET in $(find $CONFIG_DIR -type f); do
    NAME=$(echo $TARGET | perl -pe "s!$CONFIG_DIR!$HOME!")
    NAME_DIR=$(dirname $NAME)
    [ -d $NAME_DIR ] || mkdir -p $NAME_DIR

    backup $NAME
    echo "ln -fs $TARGET $NAME"
    ln -fs $TARGET $NAME
done