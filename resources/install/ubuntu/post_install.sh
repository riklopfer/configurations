#!/usr/bin/env bash

# text editor
# install sublime text
if ! [ -f /tmp/sublime-text.deb ]; then
    wget https://download.sublimetext.com/sublime-text_build-3126_amd64.deb -O /tmp/sublime-text.deb
fi
sudo dpkg -i /tmp/sublime-text.deb || {
    echo "FAILED TO INSTALL SUBLIME TEXT"
    exit 1
}

# update alternatives
sudo update-alternatives --set x-terminal-emulator $(which urxvtcd) || {
    echo "FAILED TO UPDATE ALTERNATIVES with '$(which urxvtcd) '"
}

# upgrade pip and virtual env wrapper
sudo pip install -U pip virtualenvwrapper || exit 1
