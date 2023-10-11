#! /bin/sh
theme=Nordic-Polar
icontheme=Papirus-Dark
brightnessctl set 50%
pkill -USR1 zsh
kitty +kitten themes --reload-in=all Tokyo Night Day
sed -i "s/^gtk-theme-name=.*/gtk-theme-name=$theme/" ~/.config/gtk-3.0/settings.ini
sed -i "s/^gtk-application-prefer-dark-theme=.*/gtk-application-prefer-dark-theme=0/" ~/.config/gtk-3.0/settings.ini
sed -i "s/^gtk-icon-theme-name=.*/gtk-icon-theme-name=$icontheme/" ~/.config/gtk-3.0/settings.ini
sed -i "s/^gtk-application-prefer-dark-theme=.*/gtk-application-prefer-dark-theme=0/" ~/.config/gtk-3.0/settings.ini
sed -i "s/^@theme.*/@theme \"catppuccin-latte\"/" ~/.config/rofi/config.rasi
sed -i "s/^gtk-theme-name=.*/gtk-theme-name=\"$theme\"/" ~/.gtkrc-2.0
sed -i "s/^gtk-icon-theme-name=.*/gtk-icon-theme-name=\"$icontheme\"/" ~/.gtkrc-2.0
sed -i "s/^Net\/ThemeName.*/Net\/ThemeName \"$theme\"/" ~/.config/xsettingsd/xsettingsd.conf
sed -i "s/^Net\/IconThemeName.*/Net\/IconThemeName \"$icontheme\"/" ~/.config/xsettingsd/xsettingsd.conf
sed -i "s/^palette.*/palette\ =\ \"catppuccin_latte\"/" ~/.config/starship.toml
sed -i "s/^color_theme.*/color_theme\ =\ \"\/home\/samtrek\/.config\/btop\/themes\/catppuccin_latte.theme\"/" ~/.config/btop/btop.conf
sed -i "s/^set -g @catppuccin_flavour.*/set -g @catppuccin_flavour \'latte\'/" ~/.config/tmux/tmux.conf
# ln -srf ~/.config/btop/light/btop.conf ~/.config/btop/
gsettings set org.gnome.desktop.interface icon-theme $icontheme
gsettings set org.gnome.desktop.interface gtk-theme $theme
gsettings set org.gnome.desktop.interface color-scheme prefer-light
killall -HUP xsettingsd
tmux source-file ~/.config/tmux/tmux.conf
