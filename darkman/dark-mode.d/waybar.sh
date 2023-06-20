#! /bin/zsh
#
ln -srf ~/.config/darkman/dark-mode.d/waybar ~/.config
sleep 15  && killall -SIGUSR2 waybar

