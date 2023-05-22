#! /bin/sh
if pgrep -x thunar > /dev/null; then
       exit 1 &
else
       thunar
fi
