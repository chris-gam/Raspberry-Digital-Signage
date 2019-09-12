# Raspberry-Digital-Signage
A simple Digital Signage project with Raspberry Pi and Omxplayer

You will need
<ul>
  <li>Raspberry Pi</li>
  <li>HDMI cable</li>
  <li>Micro SD Card (16gb should be fine with enough room for some videos)</li>
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
This method is good enough and there is no gap when the video plays again but you can use only one video for this.
You could merge you videos into one and you are ready to go.

If you are not able to merge the videos you can write a script and play every video there is in your videos folder:

Create the script file:

```
cd ~/Desktop
mkdir scripts 
cd /scripts
sudo nano simple_script.sh
```
and paste the following code:

```shell
#!/bin/bash

VIDEOPATH="/home/pi/Desktop/videos"
while true;
do
  for videos in $VIDEOPATH/*
    do
      omxplayer $videos
    done
done

```
ctrl-x -> y -> enter to save.

Make the file executable and run it:

```
sudo chmod +x simple_script.sh
./simple_script.sh
```
You will notice the gap between the videos in which you can see your Desktop.
I couldn't use this one so I made some changes to the script so the gap between the videos will show like a blank black screen.

Go to your scripts folder and create a new script:

```
cd ~/Desktop/sripts
sudo nano blank_gap_script.sh
```
Paste the following code:

```shell
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
```
You will need to download xterm for this script to work:

```
sudo apt-get install xterm
```
now you can make your script executable and run it:

```
sudo chmod +x blank_gap_script.sh
./blank_gap_script.sh
```
If you run into an error on the start of the second video run these commands:

```
sudo apt-get update
sudo apt-get upgrade
```
so you can update the list of available packages and their versions and install newer versions of the packages installed.

Now you can run again the script:

```
cd ~/Desktop/scripts
./blank_gap_script.sh
```
As you can see there is still the delay between the videos but instead of seeing the desktop anytime a new video starts you now see a black screen.

I chose the <b>Method 1</b> because of the really small gap even though I will need to merge my videos into one.

<h2>Remote Access</h2>

What if you want to access your raspberry from another network ?

For this task I used <a href="https://www.dataplicity.com/">Dataplicity</a>.

You simply put your email in there and a curl command will show up like this:

```
curl https://www.dataplicity.com/your_id.py | sudo python
```
Run this command in your terminal.
