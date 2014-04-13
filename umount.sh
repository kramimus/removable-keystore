#!/bin/bash

keychain -k all
killall gpg-agent
rm ~/.gpg-agent-info

for v in "${!AWS*}"; do
    unset $v
done

fusermount -u ~/.secmnt
