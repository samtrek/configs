#!/bin/sh
artist=$(playerctl metadata xesam:artist|awk -F'/' '{print $1}')
title=$(playerctl metadata xesam:title|awk -F',' '{print $1}')

state=$(playerctl status)

if [ $state == "Playing" ]; then
        icon=
elif [ $state == "Paused" ]; then
        icon=
elif [ $state == "Stopped" ]; then
        icon=
else 
        icon=""
fi
echo "$icon $artist - $title"
