#!/bin/bash
#this program captures a screenshot every second untill ctrl+C is pressed.
#On exit, convert images to a gif. 

#This program requires gnome-screenshot, coreutils, and imagemagic
#Should you want to quit, without the exit process, press ctrl+Z

####CONFIG
delay=40  #ms delay in gif loop
frames=10 #number of frames to capture
pause=1      #wait time between captures


CDIR=$PWD
#make a temporary location to store files. 
export TMPDIR=`mktemp -d  $PWD/screenCap.XXXXXX`
# trap ctrl-c and call ctrl_c()
trap ctrl_c INT
FName=$(date +%Y-%m-%d%H-%M-%S).gif
function ctrl_c() {
        echo "** Trapped CTRL-C Exit process initializing"
        convert -delay $delay -loop 0 *.png $FName
        sleep 5   #convert is funny. 
        cp $FName $CDIR
        echo -e  $FName " complete. Exiting "
        rm -rf $TMPDIR
        exit
}

cd  $TMPDIR
N=1
while true
     do
       gnome-screenshot  -f $(date +%Y-%m-%d%H-%M-%S).png 
        echo -e "you have captured" $N "frames\n"
        N=$((N + 1))
        sleep $pause
done
