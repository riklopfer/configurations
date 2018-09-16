#/usr/bin/env bash
echo "Setting up sublimetext repo"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list


sudo apt-get update || {
	echo "FAILED TO UPDATE"
	exit 1
}