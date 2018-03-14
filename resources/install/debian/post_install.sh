#!/usr/bin/env bash
echo
echo -e "Running post install script: $0"
echo 

# dropbox
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

# update alternatives
if hash urxvtcd 2>/dev/null; then
	sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(which urxvtcd) 100

	sudo update-alternatives --set x-terminal-emulator $(which urxvtcd) || {
		echo "Failed to update alternatives with '$(which urxvtcd) '"
	}
else
	echo "urxvtcd not installed"
fi
