# #!/bin/sh
# if pgrep -f lxsession >/dev/null; then
# 	exit 1 &
# else
# 	lxsession &
# fi
#
# if pgrep -x cbatticon >/dev/null; then
# 	exit 1 &
# else
# 	cbatticon &
# fi

# $HOME/.layout.sh &
# $HOME/.config/.fehbg
# picom -b &
# nm-applet &
# setxkbmap tr -option caps:escape &
#xautolock -time 10 -locker 'betterlockscreen -l dim --off 0.5' &
# thunar --deamon &
# xss-lock --transfer-sleep-lock -- slock &

if pgrep -x nchat >/dev/null; then
	exit 1 &
else
	kitty -1 --instance-group "kitty_sock" -o allow_remote_control=yes --listen-on unix:/tmp/kitty_sock --class nchat -o initial_window_width=65c -o initial_window_height=15c -e nchat &
fi
