#!/bin/bash
## 
# Install basics: window manager, browser, text editor, terminal
##
while getopts "y" opt; do
  case $opt in
    y)
      DASH_Y=-y
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

sudo apt-get update

function install_or_exit() {
    [ $1 ] && sudo apt-get install $DASH_Y "$@" || { 
        echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        echo "FAILED TO INSTALL $@"
        echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        exit 1
    }
}

# x windows
install_or_exit xorg
# window manager 
install_or_exit i3 i3status xautolock
# network manager
install_or_exit network-manager
# web browser
install_or_exit surf
# cli task manger
install_or_exit task

# text editor
# sublime text
if ! [ -f /tmp/sublime-text.deb ]; then
    wget https://download.sublimetext.com/sublime-text_build-3126_amd64.deb -O /tmp/sublime-text.deb
fi
sudo dpkg -i /tmp/sublime-text.deb || {
    echo "FAILED TO INSTALL SUBLIME TEXT"
    exit 1
}

# urxvt
install_or_exit rxvt-unicode-256color ncurses-term fonts-inconsolata
sudo update-alternatives --set x-terminal-emulator $(which urxvtcd) || {
    echo "FAILED TO UPDATE ALTERNATIVES with '$(which urxvtcd) '"
}

# python
install_or_exit python python-pip 
# upgrade pip and virtual env wrapper
sudo pip install -U pip virtualenvwrapper || exit 1
