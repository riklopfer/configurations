#!/bin/bash
## 
# Install basics: window manager, browser, text editor, terminal
##

sudo apt-get update

function install_or_exit() {
    [ $1 ] && sudo apt-get install "$@" || exit 1
}

# window manager 
install_or_exit i3 i3status
# web browser
install_or_exit chromium-browser
# cli task manger
install_or_exit task

# text editor
# sublime text
if ! [ -f /tmp/sublime-text.deb ]; then
    wget https://download.sublimetext.com/sublime-text_build-3126_amd64.deb -O /tmp/sublime-text.deb
fi
sudo dpkg -i /tmp/sublime-text.deb || exit

# urxvt
install_or_exit rxvt-unicode-256color ncurses-term fonts-inconsolata
sudo update-alternatives --set x-terminal-emulator $(which urxvtcd) || exit 1

# python
install_or_exit python python-pip 
# upgrade pip and virtual env wrapper
sudo pip install -U pip virtualenvwrapper || exit 1
