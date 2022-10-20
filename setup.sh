#! /bin/sh

sudo systemctl stop anydesk
echo Stopped Anydesk service.
sudo systemctl stop teamviewerd.service
echo Stopped Teamviewer service.
sudo rm /etc/anydesk/system.conf /etc/anydesk/service.conf
echo Removed Anydesk configuration file.
sudo rm /etc/teamviewer/global.conf
echo Removed Teamviewer configuration file.
sudo systemctl start anydesk
echo Started Anydesk service.
sleep 2
echo Avigilon11 | sudo anydesk --set-password
echo Set Avigilon11 as Anydesk unattended access password.
sudo systemctl start teamviewerd.service
sleep 2
sudo teamviewer passwd Avigilon12
echo Set Avigilon12 as Teamviewer unattended access password.
echo Done.
