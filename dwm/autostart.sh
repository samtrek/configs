#!/bin/sh

$HOME/.layout.sh &
$HOME/.config/.fehbg; picom -b &
nm-applet &
mega-sync /home/samtrek/Documents /home &
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

if pgrep -x stardict > /dev/null; then
	exit 1 &
else
	sleep 20 && stardict &
fi

if pgrep -x xautolock > /dev/null; then
	exit 1 & 
else
	 xautolock -time 10 -locker slock &
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

if pgrep -x pidgin > /dev/null; then
	exit 1 &
else
        sleep 20 && pidgin
fi

if pgrep -f joplin  > /dev/null; then
	exit 1 &
else
	sleep 10 && kitty --name "joplin" -o initial_window_width=65c -o initial_window_height=14c -e joplin &
fi
