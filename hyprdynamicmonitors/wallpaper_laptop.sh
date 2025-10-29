#!/usr/bin/env bash

if [ $(darkman get) = "light" ]; then
  swww img -o eDP-1 /home/samtrek/Documents/walpapers/demon.jpg
elif [ $(darkman get) = "dark" ]; then
  swww img -o eDP-1 /home/samtrek/Documents/walpapers/demon3.jpg
fi
