#! /bin/sh
theme=Graphite-teal-compact-nord
pkill -USR1 zsh
gsettings set org.gnome.desktop.interface gtk-theme $theme
sed -i "s/^gtk-theme-name=.*/gtk-theme-name=$theme/" ~/.config/gtk-3.0/settings.ini
sed -i "s/^@theme.*/@theme \"\/home\/samtrek\/\.local\/share\/rofi\/themes\/rounded-nord.rasi\"/" ~/.config/rofi/config.rasi
brightnessctl set 75%
sed -i "s/^gtk-theme-name=.*/gtk-theme-name=\"$theme\"/" ~/.gtkrc-2.0
sed -i "s/^Net\/ThemeName.*/Net\/ThemeName \"$theme\"/" ~/.config/xsettingsd/xsettingsd.conf
pkill xsettingsd
xsettingsd &
