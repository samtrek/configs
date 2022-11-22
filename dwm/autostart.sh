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
#xss-lock --transfer-sleep-lock -- slock &
sleep 20 && gnome-pomodoro --no-default-window --start &

if pgrep -x slstatus > /dev/null; then
	exit 1 &
else
	slstatus &
fi

if pgrep -x xautolock > /dev/null; then
        exit 1 &
else
        xautolock -time 10 -locker betterlockscreen -l --off 0.5 &
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

if pgrep -x udiskie > /dev/null; then
	exit 1 &
else
	udiskie -As &
fi

if pgrep -x greenclip > /dev/null; then
	exit 1 &
else
	greenclip daemon>/dev/null &
fi


if pgrep -x pidgin > /dev/null; then
	exit 1 &
else
        sleep 60 && pidgin &
fi

if pgrep -f sncli  > /dev/null; then
	exit 1 &
else
	sleep 10 && kitty --name "sncli" -o initial_window_width=65c -o initial_window_height=14c -e sncli &
fi
