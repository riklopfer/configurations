#!/bin/bash
## 
# Install software
##

if command -v apt >/dev/null 2>&1; then
    echo "Installing software"
    # common 
    # apt install  chromium-browser

    # not sure this will work
    # apt install sublime-text

    # terminator
    # apt install i3 terminator python-keybinder

    # urxvt
    # apt install urxvt

    # set urxvt as default terminal
    # sudo update-alternatives --set x-terminal-emulator $(which urxvt)

else
    echo "Not installing software"
fi
