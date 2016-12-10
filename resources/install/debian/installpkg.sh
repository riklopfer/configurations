#!/bin/bash
## 
# Install basics: window manager, browser, text editor, terminal
##
while getopts "y" opt; do
  case $opt in
    y)
      DASH_Y=-y
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

shift $((OPTIND-1))

if [ -z $1 ]; then
  echo "USAGE: $0 <package name>"
  exit 1
fi

source /etc/os-release
case $VERSION_ID in
    8) 
    sudo apt-get -t jessie-backports install $DASH_Y "$@"
    ;;
    *)
    sudo apt-get install $DASH_Y "$@"
    ;;
    
esac


