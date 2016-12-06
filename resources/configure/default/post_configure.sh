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

# apply Xresources changes
xrdb -merge $HOME/.Xresources

# source bashrc
source ~/.bashrc
