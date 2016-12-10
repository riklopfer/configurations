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

# Xorg.conf
echo "Generating Xorg config"
if ! [ -e /etc/X11/Xorg.conf ]; then
	sudo Xorg -configure 
	sudo cp /root/xorg.conf.new /etc/X11/xorg.conf 
fi

# apply Xresources changes
xrdb -merge $HOME/.Xresources

# source bashrc
source ~/.bashrc
