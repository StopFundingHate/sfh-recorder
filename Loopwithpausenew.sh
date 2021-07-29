#!/bin/bash

string2="`date +%H.%M.%S`"
echo "the current time is " $string2
timechunk=30
mins="`date +%M`"
seconds="`date +%S`"
echo "seconds " $seconds
echo "Current minutes " $mins
if [ $mins -lt 10 ]
then 
echo "mins is less than 10"
mins=${mins: -1}
echo "mins updated to " $mins
fi
waitmins="60"; 
waitmins=$((60-mins));
if [ $waitmins -lt 10 ]
then 
echo "waitmins is less than 10"
waitmins=${waitmins: -1}
echo "mins updated to " $waitmins
fi
echo "Wait time " $waitmins "minutes minus" $seconds
sleeptime=$((((waitmins*60)-seconds)));
echo "Sleeptime = " $sleeptime " seconds"
loops=$((sleeptime/60))
echo "loops = " $loops
#sleep $sleeptime
string2="`date +%H.%M.%S`"
echo "the current time is " $string2
echo "pausing for " $((60-seconds)) "seconds"
sleep $((60-seconds))
c=0
while [  $c -lt "$loops" ];
do  
clear
string2="`date +%H.%M.%S`"
echo "the current time is " $string2
mins="`date +%M`"
if [ $mins -lt 10 ]
then 
echo "mins is less than 10"
mins=${mins: -1}
echo "mins updated to " $mins
fi
seconds="`date +%S`"
if [ $seconds -lt 10 ]
then 
echo "seconds is less than 10"
seconds=${seconds: -1}
echo "seconds updated to " $seconds
fi
waitmins="60"; 
waitmins=$((60-mins));
if [ $waitmins -lt 10 ]
then 
echo "waitmins is less than 10"
waitmins=${waitmins: -1}
echo "mins updated to " $waitmins
fi
echo "Wait time " $waitmins "minutes minus" $seconds
sleeptime=$((((waitmins*60)-seconds)));
echo "Sleeptime = " $sleeptime " seconds"
sleep 60
c=$((c+1))
done 
string2="`date +%A_%d_%b_%Y_%H%M`"
echo $string2
cd /home/pi/shared/RPIHDD
mkdir $string2
cd $string2
COUNTER2=1

while [ $COUNTER2 -lt 1000 ];
do
COUNTER=1
         while [  $COUNTER -lt 7 ]; 
	do
             echo The counter is $COUNTER
	 ffmpeg -f v4l2 -thread_queue_size 2048 -input_format mjpeg -video_size 640x480 -framerate 10 -i /dev/video0 -f pulse -thread_queue_size 2048 -i default -codec:v h264_omx  -b:v 0.2M -b:a 48K -t 00:$timechunk:00 `date +%H%M_%A_%d_%b_%Y_`$COUNTER.mp4
             COUNTER=$((COUNTER+1))
        timechunk=30
        mins="`date +%M`"
        if [ $mins -lt 10 ]
        then 
        echo "mins is less than 10"
        mins=${mins: -1}
        echo "mins updated to " $mins
        fi
        if [ $mins = 1 ]
        then
        timechunk=29
        fi
        if [ $mins = 31 ]
        then
        timechunk=29
        fi
 
         done
cd /home/pi/shared/RPIHDD
string2="`date +%A_%d_%b_%Y_%H%M`"
mkdir $string2
cd $string2
echo "the current time is " $string2
mins="`date +%M`"
done
