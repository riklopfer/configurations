#!/bin/bash
## 
# Install software
##

if command -v apt >/dev/null 2>&1; then
    echo "Installing software"
    # common 
    sudo apt install i3 chromium-browser

    # not sure this will work
    # apt install sublime-text
    wget http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_amd64.deb -O sublime-text.deb
    sudo dpkg -i sublime-text.deb

    # terminator
    # apt install i3 terminator python-keybinder

    # urxvt
    sudo apt install urxvt
    sudo update-alternatives --set x-terminal-emulator $(which urxvt)

else
    echo "Not installing software"
fi
