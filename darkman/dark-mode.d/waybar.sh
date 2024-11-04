#! /bin/sh
ln -srf ~/.config/waybar/dark/style.css ~/.config/waybar/
# systemctl --user restart waybar
sleep 2 && killall -SIGUSR2 waybar
