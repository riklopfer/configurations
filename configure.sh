#!/bin/bash
LOC=$(dirname $(readlink -f $0))
BASE_DIR=$LOC/$(uname)

if ! [ -d $BASE_DIR ]; then
    echo "Unknown OS: $(uname)"
    exit 1
fi

##
# Link configs
##

# back up .bashrc
[ -f $HOME/.bashrc ] && ! [ -L $HOME/.bashrc ] && mv $HOME/.bashrc $HOME/.bashrc.bak

# .config/ dir
for TARGET in $(find $BASE_DIR -type f); do
    NAME=$(echo $TARGET | perl -pe "s!$BASE_DIR!$HOME!")
    NAME_DIR=$(dirname $NAME)
    [ -d $NAME_DIR ] || mkdir -p $NAME_DIR

    echo "ln -fs $TARGET $NAME"
    ln -fs $TARGET $NAME
done
