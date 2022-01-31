#!/bin/sh

$HOME/.layout.sh &
$HOME/.config/.fehbg; picom -b &
nm-applet &
setxkbmap tr -option caps:escape &

if pgrep -x dwmblocks > /dev/null; then
	exit 1 &
else
	dwmblocks &
fi

if pgrep -x sxhkd > /dev/null; then
	exit 1 &
else
	sxhkd &
fi


if pgrep -f calibre > /dev/null; then
	exit 1 &
else
	sleep 30 && calibre --start-in-tray &
fi

if pgrep -x xautolock > /dev/null; then
	exit 1 & 
else
	 xautolock -time 10 -locker slock &
fi

if pgrep -x goldendict > /dev/null; then
	exit 1 &
else
	sleep 20 && goldendict &
fi

if pgrep -f caffeine > /dev/null; then
	exit 1 &
else
	sleep 20 && caffeine &
fi

if pgrep -x pcmanfm-qt > /dev/null; then
	exit 1 &
else
	sleep 60 && pcmanfm-qt -d &
fi

if pgrep -x whatscli > /dev/null; then
	exit 1 &
else
	sleep 10 && kitty --name "whatscli" -o initial_window_width=65c -o initial_window_height=14c -e whatscli &
fi

if pgrep -f joplin  > /dev/null; then
	exit 1 &
else
	sleep 10 && kitty --name "joplin" -o initial_window_width=65c -o initial_window_height=14c -e joplin &
fi
