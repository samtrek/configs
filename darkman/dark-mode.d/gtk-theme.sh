#! /bin/sh
theme=Graphite-Dark-compact-nord
icontheme=Papirus-Dark
kitty +kitten themes --cache-age -1 --reload-in all Tokyo\ Night\ Storm
brightnessctl set 20%
sed -i "s/^gtk-theme-name=.*/gtk-theme-name=$theme/" ~/.config/gtk-3.0/settings.ini
sed -i "s/^gtk-icon-theme-name=.*/gtk-icon-theme-name=$icontheme/" ~/.config/gtk-3.0/settings.ini
sed -i "s/^@theme.*/@theme \"catppuccin-frappe\"/" ~/.config/rofi/config.rasi
sed -i "s/^gtk-theme-name=.*/gtk-theme-name=\"$theme\"/" ~/.gtkrc-2.0
sed -i "s/^gtk-icon-theme-name=.*/gtk-icon-theme-name=\"$icontheme\"/" ~/.gtkrc-2.0
sed -i "s/^Net\/ThemeName.*/Net\/ThemeName \"$theme\"/" ~/.config/xsettingsd/xsettingsd.conf
sed -i "s/^Net\/IconThemeName.*/Net\/IconThemeName \"$icontheme\"/" ~/.config/xsettingsd/xsettingsd.conf
sed -i "s/^palette.*/palette\ =\ \"catppuccin_frappe\"/" ~/.config/starship.toml
sed -i "s/^color_theme.*/color_theme\ =\ \"\/home\/samtrek\/.config\/btop\/themes\/catppuccin_frappe.theme\"/" ~/.config/btop/btop.conf
sed -i "s/^set -g @catppuccin_flavour.*/set -g @catppuccin_flavour \'frappe\'/" ~/.config/tmux/tmux.conf
# ln -srf ~/.config/btop/dark/btop.conf ~/.config/btop/
killall -HUP xsettingsd
gsettings set org.gnome.desktop.interface gtk-theme $theme
gsettings set org.gnome.desktop.interface icon-theme $icontheme
