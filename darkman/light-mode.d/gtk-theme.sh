#! /bin/sh
theme=Graphite-compact-nord
icontheme=Tela-circle-nord-light
# kitty +kitten themes --cache-age -1 --reload-in all Tokyo\ Night\ Day
brightnessctl set 20%
sed -i "s/^gtk-theme-name=.*/gtk-theme-name=$theme/" ~/.config/gtk-3.0/settings.ini
sed -i "s/^gtk-icon-theme-name=.*/gtk-icon-theme-name=$icontheme/" ~/.config/gtk-3.0/settings.ini
sed -i "s/^@theme.*/@theme \"rounded-nord\"/" ~/.config/rofi/config.rasi
sed -i "s/^gtk-theme-name=.*/gtk-theme-name=\"$theme\"/" ~/.gtkrc-2.0
sed -i "s/^gtk-icon-theme-name=.*/gtk-icon-theme-name=\"$icontheme\"/" ~/.gtkrc-2.0
sed -i "s/^Net\/ThemeName.*/Net\/ThemeName \"$theme\"/" ~/.config/xsettingsd/xsettingsd.conf
sed -i "s/^Net\/IconThemeName.*/Net\/IconThemeName \"$icontheme\"/" ~/.config/xsettingsd/xsettingsd.conf
sed -i "s/^palette.*/palette\ =\ \"catppuccin_latte\"/" ~/.config/starship.toml
# sed -i "s/^color_theme.*/color_theme\ =\ \"\/home\/samtrek\/.config\/btop\/themes\/catppuccin_latte.theme\"/" ~/.config/btop/btop.conf
# ln -srf ~/.config/btop/light/btop.conf ~/.config/btop/
killall -HUP xsettingsd
gsettings set org.gnome.desktop.interface gtk-theme $theme
gsettings set org.gnome.desktop.interface icon-theme $icontheme
