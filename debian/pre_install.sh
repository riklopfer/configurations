#/usr/bin/env bash
echo
echo "Running pre-install script"

# add backports repository
source /etc/os-release
case $VERSION_ID in
    8) 
    ! [ -f /etc/apt/sources.list.d/jessie-backports.list ] && {
        echo "deb http://httpredir.debian.org/debian jessie-backports main contrib non-free" | sudo tee /etc/apt/sources.list.d/jessie-backports.list
    }
    ;;
    *)
    echo "Not using backports for version $VERSION_ID"
    ;;
esac

sudo apt update
