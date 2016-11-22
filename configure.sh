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

function backup() {
    FILE=$1
    [ $FILE ] && [ -f $FILE ] && ! [ -L $FILE ] && mv $FILE $FILE.bak
}

# back up .bashrc
backup $HOME/.bashrc
backup $HOME/.Xresources

# .config/ dir
for TARGET in $(find $BASE_DIR -type f); do
    NAME=$(echo $TARGET | perl -pe "s!$BASE_DIR!$HOME!")
    NAME_DIR=$(dirname $NAME)
    [ -d $NAME_DIR ] || mkdir -p $NAME_DIR

    echo "ln -fs $TARGET $NAME"
    ln -fs $TARGET $NAME
done

# write out a reasonable .pastebinit.xml file
(
cat << EOF
<pastebinit>
    <pastebin>https://paste.debian.net</pastebin>
    <author>${USER}</author>
    <format>text</format>
    <jabberid>nobody@nowhere.org</jabberid>
</pastebinit>
EOF
) > $HOME/.pastebinit.xml

# create link to .pushover if it exists where we expect it to be
[ -f $HOME/Dropbox/Private/.pushover ] && ! [ -L $HOME/.pushover ] && ln -fs $HOME/Dropbox/Private/.pushover $HOME/.pushover

# apply Xresources changes
xrdb -merge $HOME/.Xresources

# source bashrc
source ~/.bashrc
