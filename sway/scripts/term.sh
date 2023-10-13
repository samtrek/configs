#! /bin/sh

if [ $(darkman get) = "light" ]; then footclient -o include=~/.config/foot/catppuccin-latte.conf $@; else footclient -o include=~/.config/foot/catppuccin-frappe.conf $@; fi
