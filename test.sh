#!/bin/bash

hour="03"

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
