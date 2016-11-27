#/usr/bin/env bash
echo
echo "Running pre-install script"
sudo apt update

source /etc/os-release
case $VERSION_ID in
    8) echo "deb http://ftp.debian.org/debian jessie-backports main" | sudo tee -a /etc/sources.list.d/backports.list
esac
