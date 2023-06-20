#! /bin/zsh
#
ln -srf ~/.config/darkman/dark-mode.d/waybar ~/.config
killall -SIGUSR2 waybar

