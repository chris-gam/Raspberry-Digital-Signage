# Raspberry-Digital-Signage
A simple Digital Signage project with Raspberry Pi and Omxplayer

You will need
<ul>
  <li>Raspberry Pi</li>
  <li>HDMI cable</li>
  <li>Micro SD Card (16gb should be fine)</li>
  <li>Internet Connection</li>
  <li>Mouse/Keyboard</li>
  </ul>
  
  <h2>Installation</h2>

You can download Raspbian from <a href="https://www.raspberrypi.org/downloads/"><b>here</b></a>.

Read the <a href="https://www.raspberrypi.org/documentation/installation/installing-images/">tutorial</a> for installation info.

We will use the <b>OMXPlayer</b> which is included with the Raspbian operating system.

Download two or more dummy short videos for testing and place them in the folder "videos" on your Desktop.

You can do this via the Raspberry terminal:

```
cd ~/Desktop
mkdir videos
wget http:/link-to-video1.mp4 && wget http:/link-to-video2.mp4
```
The OMXPlayer works like this:

```
cd ~/Desktop/videos
omxplayer video1.mp4
```
You can also play the video on Loop and add audio output to HDMI, let's call it <b>Method 1</b>

```
omxplayer --loop -o hdmi video1.mp4 
```

You will notice the "Seek" text at the bottom of the screen, if you want this removed add --no-osd:

```
omxplayer --loop --no-osd -o hdmi video1.mp4 
```

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
