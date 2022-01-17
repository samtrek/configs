#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
$HOME/.layout.sh &
$HOME/.fehbg &
setxkbmap tr -option caps:escape &
picom -b &
dwmblocks &
nm-applet &
xautolock -time 10 -locker slock &
xss-lock --transfer-sleep-lock -- slock &
sleep 60 && goldendict &
sleep 30 && kitty --name "whatscli" -o initial_window_width=65c -o initial_window_height=14c -e whatscli &
sleep 15 && kitty --name "joplin" -o initial_window_width=65c -o initial_window_height=14c -e joplin &
sleep 30 && mw -Y &
sleep 60 && pcmanfm -d &
sleep 60 && calibre --start-in-tray &
sleep 60 && caffeine --start-in-tray &
exec dwm
