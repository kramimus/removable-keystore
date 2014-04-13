#!/bin/bash

target=$1

# only mount if mountpoint looks unused
find ~/.secmnt -maxdepth 0 -empty -exec encfs ${target}/secmnt ~/.secmnt \;

source ~/.aws/profile

# only run gpg-agent if not already connected
gpg-agent &> /dev/null || gpg-agent --daemon --enable-ssh-support \
    --write-env-file "${HOME}/.gpg-agent-info"
source ~/.gpg-agent-info

keychain --ignore-missing ~/.ssh/*


