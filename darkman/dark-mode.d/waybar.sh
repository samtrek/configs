#! /bin/sh
ln -srf ~/.config/waybar/dark/style.css ~/.config/waybar/
sleep 2 && killall -SIGUSR2 waybar
