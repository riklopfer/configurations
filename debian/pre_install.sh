#/usr/bin/env bash
echo
echo "Running pre-install script"

source /etc/os-release
case $VERSION_ID in
    8) 
    echo "deb http://ftp.debian.org/debian jessie-backports main" | sudo tee -a /etc/apt/sources.list.d/backports.list
    ;;
    *)
    echo "Not using backports for version $VERSION_ID"
    ;;
esac

sudo apt update
