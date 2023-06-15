#! /bin/sh
ln -srf ~/.config/darkman/light-mode.d/waybar ~/.config/
sleep 15 && killall -SIGUSR2 waybar
