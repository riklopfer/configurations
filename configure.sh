#!/bin/bash
LOC=$(dirname $(readlink -f $0))

## 
# Install software
##
# apt install i3 terminator python-keybinder chromium-browser

# not sure this will work
# apt install sublime-text

##
# Link configs
##

# .bashrc
# TODO

# .config/ dir
for TARGET in $(find $LOC/.config -type f); do
    NAME=$(echo $TARGET | perl -pe "s!$LOC!$HOME!")
    NAME_DIR=$(dirname $NAME)
    [ -d $NAME_DIR ] || mkdir -p $NAME_DIR
    ln -s $TARGET $NAME
done
