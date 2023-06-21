#! /bin/sh
ln -srf ~/.config/darkman/light-mode.d/waybar ~/.config/
sleep 2 && killall -SIGUSR2 waybar
