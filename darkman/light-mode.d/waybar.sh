#! /bin/sh
ln -srf ~/.config/waybar/light/style.css ~/.config/waybar
sleep 2 && killall -SIGUSR2 waybar
