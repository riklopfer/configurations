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
sudo apt-get install -y wget curl || {
	echo "FAILED TO INSTALL BASIC NET UTILS"
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

sudo apt-get update || {
	echo "FAILED TO UPDATE"
	exit 1
}
