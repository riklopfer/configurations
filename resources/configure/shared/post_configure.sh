#!/bin/bash

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
