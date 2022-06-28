#!/bin/sh
if pgrep -f lxsession > /dev/null; then
	exit 1 &
else
	lxsession &
fi

$HOME/.layout.sh &
$HOME/.config/.fehbg; picom -b &
nm-applet &
setxkbmap tr -option caps:escape &
xss-lock --transfer-sleep-lock -- i3lock-fancy --nofork &

if pgrep -x slstatus > /dev/null; then
	exit 1 &
else
	slstatus &
fi

if pgrep -x sxhkd > /dev/null; then
	exit 1 &
else
	sxhkd &
fi
jk
if pgrep -x stardict > /dev/null; then
	exit 1 &
else
	sleep 20 && stardict &
fi

if pgrep -x udiskie > /dev/null; then
	exit 1 &
else
	udiskie -As &
fi

if pgrep -x pidgin > /dev/null; then
	exit 1 &
else
        sleep 60 && pidgin
fi

if pgrep -f joplin  > /dev/null; then
	exit 1 &
else
	sleep 10 && kitty --name "joplin" -o initial_window_width=65c -o initial_window_height=14c -e joplin &
fi
