#/usr/bin/env bash
DIST_NAME=sid
if [ $1 ]; then
    DIST_NAME=$1
fi

echo
echo "Running pre install script for: $DIST_NAME"
echo 

sudo apt-get update || { 
	echo "FAILED TO UPDATE"
	exit 1
}
sudo apt-get install -y wget curl wget || {
	echo "FAILED TO INSTALL curl"
	exit 1
}

sudo apt-get install -y netselect-apt || {
	echo "FAILED TO INSTALL netselect-apt"
	exit 1
}

# update to sid! 
sudo netselect-apt ${DIST_NAME} -no /etc/apt/sources.list || {
	echo "Failed to update to sid... continuing"
}

sudo apt install apt-transport-https || {
	echo "Failed to install https transport"
}

echo "Setting up sublimetext repo"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

echo "Setting up Google repos"
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list


sudo apt-get update || {
	echo "FAILED TO UPDATE"
	exit 1
}