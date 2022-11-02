#!/bin/sh
date=$(date +"%d-%m-%H-%M")
#recording path
_rpath="/home/administrator/Recordings/$date/"
mkdir -p /home/administrator/Recordings/$date
ffmpeg -i rtsp://root:Vivotek00@192.168.123.2:554/live1s2.sdp -strict -2 -b:v 300k -vcodec copy -f segment -segment_time 60 -reset_timestamps 1 -strftime 1 -t 02:05:00 -y $_rpath%H%M.mp4