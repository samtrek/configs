#! /bin/sh
ln -srf ~/.config/darkman/dark-mode.d/waybar ~/.config
sleep 2 && killall -SIGUSR2 waybar
