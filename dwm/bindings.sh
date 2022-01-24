#!/bin/sh

if pgrep -f stat > /dev/null; then
	exit 1
else
	kitty --title "stat" --name "stat" -e nvim
fi
