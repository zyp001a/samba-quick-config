#!/bin/bash
USER=$1
PASS=$2
useradd -c "SMB user" -m -g smbusers -p $PASS $USER
(echo $PASS; echo $PASS) | smbpasswd -a $USER -s
mkdir -p /export/$USER
chown $USER.smbusers /export/$USER
chmod 775 /export/$USER


