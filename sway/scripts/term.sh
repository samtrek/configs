#! /bin/sh
if pgrep -f "kitty --class term" > /dev/null; then
       exit 1 &
else
       kitty --class term -1 -o initial_window_height=13c -o initial_window_width=70c
fi
