#!/usr/bin/env bash

[ -d $HOME/.password-store ] && rm -rf $HOME/backup_password-store && mv $HOME/.password-store $HOME/backup_password-store

git clone rklopfer@git.klopfer.us:repos/password-store $HOME/.password-store || { 
	echo "Failed to clone password-store"
	exit 1
}

scp git.klopfer.us:.privkey.asc $HOME/.privkey.asc || {
	echo "Failed to obtain private key"
	exit 1
}

gpg --import $HOME/.privkey.asc || {
	echo "Failed to import private key"
	exit 1
}
