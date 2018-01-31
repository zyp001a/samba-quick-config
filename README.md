# Usage:
Alter install samba, run command:
```
sudo ./config.sh [user] [user-pass] [guest] [guest-pass]
```
restart sshd and smbd service;

## Windows 10 known issue
https://social.technet.microsoft.com/Forums/en-US/26e5fd75-f3ab-4ffe-ace4-ed4ba96f82e5/not-discovering-ubuntu-server-on-network?forum=win10itpronetworking
### solution
Run Windows PowerShell as 'Administrator'
Enter the following commands:
```
sc.exe config lanmanworkstation depend= bowser/mrxsmb10/nsi 
sc.exe config mrxsmb20 start= disabled
```
reboot
