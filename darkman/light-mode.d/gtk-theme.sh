#! /bin/sh
theme=Catppuccin-Latte-Standard-Teal-light
icontheme=Papirus-Light
brightnessctl set 50%
pkill -USR1 zsh
kitty +kitten themes --reload-in=all Catppuccin-Latte
sed -i "s/^gtk-theme-name=.*/gtk-theme-name=$theme/" ~/.config/gtk-3.0/settings.ini
sed -i "s/^gtk-icon-theme-name=.*/gtk-icon-theme-name=$icontheme/" ~/.config/gtk-3.0/settings.ini
sed -i "s/^@theme.*/@theme \"\/home\/samtrek\/\.local\/share\/rofi\/themes\/rounded-nord.rasi\"/" ~/.config/rofi/config.rasi
sed -i "s/^gtk-theme-name=.*/gtk-theme-name=\"$theme\"/" ~/.gtkrc-2.0
sed -i "s/^gtk-icon-theme-name=.*/gtk-icon-theme-name=\"$icontheme\"/" ~/.gtkrc-2.0
sed -i "s/^Net\/ThemeName.*/Net\/ThemeName \"$theme\"/" ~/.config/xsettingsd/xsettingsd.conf
sed -i "s/^Net\/IconThemeName.*/Net\/IconThemeName \"$icontheme\"/" ~/.config/xsettingsd/xsettingsd.conf
sed -i "s/^palette.*/palette\ =\ \"catppuccin_latte\"/" ~/.config/starship.toml
sed -i "s/^color_theme.*/color_theme\ =\ \"\/home\/samtrek\/.config\/btop\/themes\/catppuccin_latte.theme\"/" ~/.config/btop/btop.conf
# ln -srf ~/.config/btop/light/btop.conf ~/.config/btop/
gsettings set org.gnome.desktop.interface icon-theme $icontheme
gsettings set org.gnome.desktop.interface gtk-theme $theme
killall -HUP xsettingsd
