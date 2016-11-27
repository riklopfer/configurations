#/usr/bin/env bash
echo
echo "Running pre-install script"

source /etc/os-release
case $VERSION_ID in
    8) 
    ! [ -f /etc/apt/sources.list.d/jessie-backports.list ] && {
        echo "deb http://ftp.debian.org/debian jessie-backports main" | sudo tee /etc/apt/sources.list.d/jessie-backports.list
    }
    ;;
    *)
    echo "Not using backports for version $VERSION_ID"
    ;;
esac

sudo apt update
