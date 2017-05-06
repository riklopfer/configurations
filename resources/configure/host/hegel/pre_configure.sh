#!/usr/bin/env bash

if ! [ -e $HOME/.privkey.asc ]; then
	# download private key or fail
	scp git.klopfer.us:.privkey.asc $HOME/.privkey.asc || {
		echo "Failed to obtain private key"
		exit 1
	}
fi

gpg2 --import $HOME/.privkey.asc || {
	echo "Failed to import private key"
	exit 1
}

if ! [ -d $HOME/.password-store ]; then
	# clone password repository or fail
	git clone rklopfer@git.klopfer.us:repos/password-store $HOME/.password-store || { 
		echo "Failed to clone password-store"
		exit 1
	}
else
	# update password repository.. or don't fail
	cd $HOME/.password-store
	git pull
fi