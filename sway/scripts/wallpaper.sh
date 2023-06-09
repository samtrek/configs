#! /bin/sh

if [ $(darkman get) = "light" ]; then ~/.config/darkman/light-mode.d/wallpaper.sh; else ~/.config/darkman/dark-mode.d/wallpaper.sh; fi
