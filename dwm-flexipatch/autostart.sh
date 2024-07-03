#!/bin/sh

if pgrep -x slstatus >/dev/null; then
	exit 1 &
else
	slstatus &
fi

if pgrep -x cbatticon >/dev/null; then
	exit 1 &
else
	cbatticon -c "systemctl hibernate" &
fi

$HOME/.layout.sh &
$HOME/.config/.fehbg &
picom -b &
nm-applet &
thunar --deamon &
caffeine start &

if pgrep -x redshift >/dev/null; then
	exit 1 &
else
	redshift &
fi

if pgrep -x xob >/dev/null; then
	exit 1 &
else
	$HOME/.config/sxhkd/pulse-volume-watcher.py | xob &
	$HOME/.config/sxhkd/brightness-watcher.py | xob &
fi

if pgrep -x blueman-applet >/dev/null; then
	exit 1 &
else
	blueman-applet &
fi

if pgrep -x udiskie >/dev/null; then
	exit 1 &
else
	udiskie -As &
fi

if pgrep -x nchat >/dev/null; then
	exit 1 &
else
	kitty -1 --instance-group "kitty_sock" -o allow_remote_control=yes --listen-on unix:/tmp/kitty_sock --class nchat -o initial_window_width=65c -o initial_window_height=15c -e nchat &
fi

if pgrep -x syncthing-gtk >/dev/null; then
	exit 1 &
else
	syncthing-gtk &
fi

if pgrep -x pomo.sh >/dev/null; then
	exit 1 &
else
	pomo.sh start &
	pomo.sh notif &
fi

if pgrep -x xsettingsd >/dev/null; then
	exit 1 &
else
	xsettingsd &
fi
