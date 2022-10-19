#!/bin/sh

date=$(date +"%d-%m-%H:%M")

read -p "Enter site name: " sitename
read -p "Enter camera location: " camlocation
read -p "Enter camera's IP address: " ipadd


#file name's full path
_fullpath="$sitename$camlocation$date"
#directory path of recording
_path="/home/administrator/Desktop/$_fullpath"
_name="$sitename$camlocation"
_rpath="/home/administrator/Recordings/$date/"
mkdir -p /home/administrator/Recordings/$date

while true; do
read -p "Recording will be based on $ipadd $sitename's $camlocation post camera. Continue? (Y/N): " confirm
case $confirm in
[Yy]* ) ffmpeg -i rtsp://root:Vaxtor00@$ipadd:554/live1s2.sdp -strict -2 -b:v 100K -vcodec copy -f segment -segment_time 60 -reset_timestamps 1 -strftime 1 -t 02:05:00 -y $_rpath$_name-%H%M.mp4
;;
[Nn]* ) exit;;
* ) echo "Please answer Y or N.";;
esac
done 