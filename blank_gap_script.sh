#!/bin/bash
VIDEOPATH="/home/pi/Desktop/videos"
while true; 
do
  for videos in $VIDEOPATH/*
    do
      xterm -fullscreen -fg white -bg black -e omxplayer -o hdmi -r "$videos"
      xrefresh -display :0
    done
done
