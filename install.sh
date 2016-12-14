#!/usr/bin/env bash
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

LOC=$(dirname $(readlink -f $0))

if ! source /etc/os-release 2> /dev/null; then
    echo "Cannot find /etc/os-release -- don't know how to proceed."
    exit 1
fi

BASE_DIR=$LOC/resources/install
if ! [ -d $BASE_DIR/$ID ]; then 
    echo "No install scripts for OS: $ID"
    exit 1
fi

[ -f $BASE_DIR/$ID/pre_install.sh ] && . $BASE_DIR/$ID/pre_install.sh

echo 
echo "Installing packages for $ID"
echo 
grep -v '^#' < $BASE_DIR/$ID/packages.list | { 
  while read PACKAGE; do
    if ! [ "$PACKAGE" ]; then
      continue
    fi
    . $BASE_DIR/$ID/installpkg.sh $DASH_Y $PACKAGE || exit 1
  done 
}

[ -f $BASE_DIR/$ID/post_install.sh ] && . $BASE_DIR/$ID/post_install.sh
