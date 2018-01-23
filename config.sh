#!/bin/bash
USER=$1
PASS=$2
GUEST_USER=$3
GUEST_PASS=$4
cp smb.conf smb.conf.user
mv /etc/samba/smb.conf /etc/samba/smb.conf.bak
cp smb.conf.user /etc/samba/smb.conf
groupadd smbusers
groupadd smbguests
useradd -c "SMB user" -m -g smbusers -p $PASS $USER
useradd -c "SMB guest" -m -g smbguests -p $GUEST_PASS $GUEST_USER
(echo $PASS; echo $PASS) | smbpasswd -a $USER -s
(echo $GUEST_PASS; echo $GUEST_PASS) | smbpasswd -a $GUEST_USER -s
echo "DenyGroups smbusers smbguests" >>/etc/ssh/sshd_config
mkdir /export
chown $USER.smbusers /export
chmod 775 /export


