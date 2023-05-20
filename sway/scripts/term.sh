#! /bin/sh
if pgrep -f "st -n term" > /dev/null; then
       exit 1 &
else
       st -n term -g 70x13
fi
