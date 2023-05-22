#! /bin/sh
if pgrep -x "btop" > /dev/null; then
       exit 1 &
else
        kitty --class btop -1 -o initial_window_height=30c -o initial_window_width=45c -e btop
fi
