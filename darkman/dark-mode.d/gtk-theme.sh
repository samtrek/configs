#! /bin/sh
theme=Nordic-darker
icontheme=Papirus-Dark
pkill -USR1 zsh
brightnessctl set 20%
killall -HUP xsettingsd
sed -i "s/^gtk-theme-name=.*/gtk-theme-name=$theme/" ~/.config/gtk-3.0/settings.ini
sed -i "s/^gtk-icon-theme-name=.*/gtk-icon-theme-name=$icontheme/" ~/.config/gtk-3.0/settings.ini
sed -i "s/^@theme.*/@theme \"\/home\/samtrek\/\.local\/share\/rofi\/themes\/rounded-nord-dark\"/" ~/.config/rofi/config.rasi
sed -i "s/^gtk-theme-name=.*/gtk-theme-name=\"$theme\"/" ~/.gtkrc-2.0
sed -i "s/^gtk-icon-theme-name=.*/gtk-icon-theme-name=\"$icontheme\"/" ~/.gtkrc-2.0
sed -i "s/^Net\/ThemeName.*/Net\/ThemeName \"$theme\"/" ~/.config/xsettingsd/xsettingsd.conf
sed -i "s/^Net\/IconThemeName.*/Net\/IconThemeName \"$icontheme\"/" ~/.config/xsettingsd/xsettingsd.conf
gsettings set org.gnome.desktop.interface gtk-theme $theme
gsettings set org.gnome.desktop.interface icon-theme $icontheme
