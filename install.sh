#!/bin/bash
## 
# Install software
##

if command -v apt >/dev/null 2>&1; then
    echo "Installing software"
    # common 
    sudo apt install i3 chromium || exit

    # not sure this will work
    # apt install sublime-text
    wget http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_amd64.deb -O sublime-text.deb
    sudo dpkg -i sublime-text.deb || exit

    # terminator
    # apt install i3 terminator python-keybinder

    # urxvt
    sudo apt install rxvt-unicode fonts-inconsolata || exit
    sudo update-alternatives --set x-terminal-emulator $(which urxvt) || exit

else
    echo "Not installing software"
fi
