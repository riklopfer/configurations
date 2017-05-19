#/usr/bin/env bash
echo
echo "Running pre install script: $0"
echo 

sudo apt-get update || { 
	echo "FAILED TO UPDATE"
	exit 1
}
sudo apt-get install -y wget curl || {
	echo "FAILED TO INSTALL BASIC NET UTILS"
	exit 1
}

sudo apt-get install -y netselect-apt || {
	echo "FAILED TO INSTALL netselect-apt"
	exit 1
}

# update to sid! 
sudo netselect-apt sid -no /etc/apt/sources.list || {
	echo "Failed to update to sid... continuing"
}

sudo apt-get update || {
	echo "FAILED TO UPDATE"
	exit 1
}
