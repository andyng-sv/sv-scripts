#!/bin/sh


ffmpeg -i rtsp://root:Vaxtor00@10.0.0.54:554/live1s2.sdp -strict -2 -b:v 900K -vcodec copy -r 8 -t 02:05:00 -y /home/administrator/Desktop/test.mp4

