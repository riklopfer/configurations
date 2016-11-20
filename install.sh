#!/bin/bash
## 
# Install software
##

if command -v apt >/dev/null 2>&1; then
    echo "Installing software"
    # common 
    sudo apt install i3 chromium python openjdk-8-jdk openjdk-7-jdk || exit

    # sublime text
    if ! [ -f /tmp/sublime-text.deb ]; then
        wget https://download.sublimetext.com/sublime-text_build-3126_amd64.deb -O /tmp/sublime-text.deb
    fi
    sudo dpkg -i /tmp/sublime-text.deb || exit

    # terminator
    # apt install i3 terminator python-keybinder

    # urxvt
    sudo apt install rxvt-unicode fonts-inconsolata || exit
    sudo update-alternatives --set x-terminal-emulator $(which urxvt) || exit

else
    echo "Not installing software"
fi
