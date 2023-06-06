#! /bin/sh
pkill -USR1 zsh
theme=Graphite-teal-Dark-compact-nord
gsettings set org.gnome.desktop.interface gtk-theme $theme
sed -i "s/^gtk-theme-name=.*/gtk-theme-name=$theme/" ~/.config/gtk-3.0/settings.ini
