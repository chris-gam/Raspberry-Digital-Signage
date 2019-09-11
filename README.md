# Raspberry-Digital-Signage
A simple Digital Signage project with Raspberry Pi and Omxplayer

```shell
#!/bin/bash
VIDEOPATH="/home/pi/Desktop/videos"
while true; 
do
  for video in $VIDEOPATH/*
    do
      xterm -fullscreen -fg white -bg black -e omxplayer -o hdmi -r "$video"
      xrefresh -display :0
    done
done
```
