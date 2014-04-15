#!/bin/bash

target=$1
if [ -z "$target" ]; then
	target=${HOME}
fi

if [ ! -e ${target}/secmnt ]; then
	echo "missing ${target}/secmnt, exiting"
	exit 1
fi

# only mount if mountpoint looks unused
find ~/.secmnt -maxdepth 0 -empty -exec encfs --idle=20 ${target}/secmnt ~/.secmnt \;

source ~/.aws/profile

# only run gpg-agent if not already connected
gpg-agent &> /dev/null || gpg-agent --daemon --enable-ssh-support \
    --write-env-file "${HOME}/.gpg-agent-info"
source ~/.gpg-agent-info

eval $(keychain --eval --ignore-missing ~/.ssh/*)


