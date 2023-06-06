#! /bin/sh

if [ $(darkman get) = "light" ]; then footclient -o include=/usr/share/foot/themes/tokyonight-day $@; else footclient -o include=/usr/share/foot/themes/nord $@; fi
