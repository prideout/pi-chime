#!/bin/bash
# Triggered through Crontab every 30 minutes

minute=$(date +"%M")

if [[ $minute == 30 ]]
then
  play "/home/pi/chime/gong.mp3"
elif [[ $minute == 00 ]]
then
  # play "/home/pi/chime/westminster.mp3"
  hour=$(date +"%I")
  if [[ $hour == 01 ]]
    then
        play /home/pi/chime/gong.mp3
  else
   chime="sox /home/pi/chime/gong.mp3 -p pad 3 0 |"
   x=2
   while [ $x -lt $hour ]; do
      chime="$chime sox - -m /home/pi/chime/gong.mp3 -p pad 3 0 remix v2 |"
      let x=x+1
    done

    eval $chime \
    play - -m /home/pi/chime/gong.mp3 remix v2
   fi
else
    play -v 0.005 "/home/pi/chime/tick.mp3"    
fi
