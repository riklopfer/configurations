#!/bin/bash
## 
# Install basics: window manager, browser, text editor, terminal
##

if command -v apt >/dev/null 2>&1; then
    echo "Installing software"
    sudo apt update

    # window manager and browser
    sudo apt install i3 chromium || exit

    # install python
    sudo apt install python python-pip || exit

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
