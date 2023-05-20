#! /bin/sh
if pgrep -f "st -n btop" > /dev/null; then
       exit 1 &
else
       st -n btop -g 65x25 -e btop
fi
