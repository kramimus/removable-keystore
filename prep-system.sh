#!/bin/bash

target=$1

sudo apt-get install encfs gpg-agent keychain

mkdir -p ~/.secmnt
sudo mkdir -p ${target}/secmnt
sudo chown $(id -un). ${target}/secmnt
encfs ${target}/secmnt ~/.secmnt

if [ ! -e ~/.secmnt/ssh ]; then
    cp -r ~/.ssh ~/.secmnt/ssh
fi

if [ ! -e ~/.secmnt/gnupg ]; then
    cp -r ~/.gnupg ~/.secmnt/gnupg
fi

if [ ! -e ~/.secmnt/aws ]; then
    cp -r ~/.aws ~/.secmnt/aws
fi

mv ~/.ssh ~/.ssh.bak
mv ~/.gnupg ~/.gnupg.bak
mv ~/.aws ~/.aws.bak

ln -s ~/.secmnt/ssh ~/.ssh
ln -s ~/.secmnt/gnupg ~/.gnupg
ln -s ~/.secmnt/aws ~/.aws
