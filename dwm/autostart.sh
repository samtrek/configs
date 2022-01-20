#!/bin/sh
$HOME/.layout.sh &
$HOME/.fehbg; picom -b &
dwmblocks &
nm-applet &
sleep 20 && caffeine &
sleep 60 && goldendict &
sleep 60 && pcmanfm -d &
sleep 60 && calibre --start-in-tray &
