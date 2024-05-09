#! /bin/sh
if pgrep -f "kitty_rcode" >/dev/null; then
	exit 1 &
else

	kitty -1 --instance-group "kitty_rcode" -o allow_remote_control=yes --listen-on unix:/tmp/kitty_rcode --class rcode -T rcode -d /home/samtrek/Documents/phd_thesis/ -e nvim &
	# kitty --class rcode -1 -o initial_window_height=30c -o initial_window_width=60c -e nvim
fi
