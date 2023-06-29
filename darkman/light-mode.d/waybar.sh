#! /bin/sh
ln -srf ~/.config/darkman/light-mode.d/waybar ~/.config/
killall -SIGUSR2 waybar
