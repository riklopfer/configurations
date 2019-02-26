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

# Dropbox
if ! dpkg -s dropbox >& /dev/null ; then
	echo "Installing dropbox"
	if ! [ -f /tmp/dropbox.deb ]; then
		wget https://www.dropbox.com/download?dl=packages/debian/dropbox_2015.10.28_amd64.deb -O /tmp/dropbox.deb
	fi
	sudo dpkg -i /tmp/dropbox.deb || {
		sudo apt-get -f install -y || {
			echo "Failed to install DROPBOX"
			exit 1
		}
	}
fi

# Google Chrome
sudo apt-get -y install libxss1 libappindicator1 libindicator7
curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o /tmp/chrome-installer.deb
sudo dpkg -i /tmp/chrome-installer.deb
sudo apt --fix-broken install

# update alternatives
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(which urxvtcd) 100

sudo update-alternatives --set x-terminal-emulator $(which urxvtcd) || {
    echo "FAILED TO UPDATE ALTERNATIVES with '$(which urxvtcd) '"
}
