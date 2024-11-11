#! /bin/sh

# pkill swaybg
# swaybg -o DVI-I-1 -i /home/samtrek/Documents/walpapers/luffy3.jpg -m fill -o DVI-I-2 -i /home/samtrek/Documents/walpapers/demon.jpg -m fill -o eDP-1 -i /home/samtrek/Documents/walpapers/luffy3.jpg &

# swww img -o DVI-I-2 /home/samtrek/Documents/walpapers/luffy3.jpg
# swww img -o DVI-I-1 /home/samtrek/Documents/walpapers/demon.jpg
# swww img -o eDP-1 /home/samtrek/Documents/walpapers/luffy3.jpg
hyprctl hyprpaper wallpaper "DVI-I-1, ~/Documents/walpapers/demon.jpg"
hyprctl hyprpaper wallpaper "DVI-I-2, ~/Documents/walpapers/luffy3.jpg"
hyprctl hyprpaper wallpaper "eDP-1, ~/Documents/walpapers/luffy3.jpg"
