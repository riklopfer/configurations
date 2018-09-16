#!/usr/bin/env bash
echo
echo -e "Running post install script: $0"
echo 

# surf
# ! [ -d $HOME/Git ] && mkdir $HOME/Git
# git clone http://git.suckless.org/surf $HOME/Git/surf
# cd $HOME/Git/surf
# sudo make clean install || exit 1
# cd -


sudo apt-get install libxss1 libappindicator1 libindicator7
curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o /tmp/chrome-installer.deb
sudo dpkg -i /tmp/chrome-installer.deb

# update alternatives
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(which urxvtcd) 100

sudo update-alternatives --set x-terminal-emulator $(which urxvtcd) || {
    echo "FAILED TO UPDATE ALTERNATIVES with '$(which urxvtcd) '"
}

# upgrade pip and virtual env wrapper
sudo pip install -U pip virtualenvwrapper || exit 1
