encfs-based keystore scripts
===========================

A bunch of scripts to generate an encfs keystore, set up links to
various encryption keys, mount the keystore, and unmount the keystore.

This is currently setup to be used for:

- ssh keys (w/ keychain)
- gnupg keys (w/ gpg-agent)
- AWS keys

The prep-system.sh command WILL move your existing keys to ~/*.bak
directories, so you should probably look at the scripts and understand
what they do before running them.
