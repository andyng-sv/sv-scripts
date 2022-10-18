#!/bin/bash

echo "RTSP stream recorder via FFMPEG tool."
echo "----------------------------------------"
echo "(1) -----> ENABLE 0600 - 0800 recording."
echo "(2) -----> ENABLE 1300 - 1500 recording."
echo "(3) -----> ENABLE 1800 - 2000 recording."
echo "(4) -----> DISABLE 0600 - 0800 recording."
echo "(5) -----> DISABLE 1300 - 1500 recording."
echo "(6) -----> DISABLE 1800 - 2000 recording."
echo "-----------------------------------------"
echo "Please choose from option 1 - 6: "

read OPTION 

case $OPTION in
    1)
        if crontab -l | grep -q '55 5';
        then
        echo "0600 - 0800 recording is already enabled."
        else
        echo "Enabled 0600 - 0800 recording."
        (crontab -l 2>/dev/null; echo "55 5 * * * sh /home/administrator/ffmpeg.sh") | crontab -
        fi
        ;;

    2)
        if crontab -l | grep -q '55 12';
        then
        echo "1300 - 1500 recording is already enabled."
        else
        echo "Enabled 1300 - 1500 recording."
        (crontab -l 2>/dev/null; echo "55 12 * * * sh /home/administrator/ffmpeg.sh") | crontab -
        fi
        ;;

    3)
        if crontab -l | grep -q '55 17';
        then
        echo "1800 - 2000 recording is already enabled."
        else
        echo "Enabled 1800 - 2000 recording."
        (crontab -l 2>/dev/null; echo "55 17 * * * sh /home/administrator/ffmpeg.sh") | crontab -
        fi
        ;;
    
    4)
        if ! crontab -l | grep -q '55 5';
        then
        echo "0600 - 0800 recording is already disabled."
        else
        echo "Disabled 0600 - 0800 recording."
        crontab -u administrator -l | grep -v '55 5 * * * sh /home/administrator/ffmpeg.sh' | crontab -u administrator -
        fi
        ;;

    5)
        if ! crontab -l | grep -q '55 12';
        then
        echo "1300 - 1500 recording is already disabled."
        else
        echo "Disabled 1300 - 1500 recording."
        crontab -u administrator -l | grep -v '55 12 * * * sh /home/administrator/ffmpeg.sh' | crontab -u administrator -
        fi
        ;;

    6)
        if ! crontab -l | grep -q '55 17';
        then
        echo "1800 - 2000 recording is already disabled."
        else
        echo "Disabled 1800 - 2000 recording."
        crontab -u administrator -l | grep -v '55 17 * * * sh /home/administrator/ffmpeg.sh' | crontab -u administrator -
        fi
        ;;

esac