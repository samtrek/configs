#! /bin/sh
if pgrep -x "ncmpcpp" > /dev/null; then
       exit 1 &
else
        kitty --class ncmpcpp -1 -o initial_window_height=15c -o initial_window_width=65c -e ncmpcpp
fi
