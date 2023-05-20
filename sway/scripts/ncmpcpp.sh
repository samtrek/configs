#! /bin/sh
if pgrep -f "st -n ncmpcpp" > /dev/null; then
       exit 1 &
else
       st -n ncmpcpp -g 65x15 -e ncmpcpp
fi
