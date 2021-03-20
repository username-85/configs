#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xresources_file="${HOME}/.config/xresources/Xresources_${HOSTNAME}"

if [ $HOSTNAME = "laptop" ]; then
    output_hdmi=$(xrandr | awk '/connected/ && /HDMI1/ { print; }' | cut -d " " -f1)

    if [ -n "$output_hdmi" ]; then
        xresources_file="${xresources_file}_hdmi"
    fi
fi

xrdb -merge $xresources_file

slock &

export QT_QPA_PLATFORMTHEME=gtk2
mkdir -p /tmp/downloads
mkdir -p /tmp/misc
mkdir -p /tmp/music
mkdir -p /tmp/mutt

autocutsel -fork &
autocutsel -selection PRIMARY -fork &

dunst &

xset +dpms # enable dpms
xset dpms 900 1200 1500 #blank, suspend,poweroff
xss-lock --ignore-sleep slock &

unclutter -root -idle 1 -jitter 3 &

xsetroot -cursor_name left_ptr

exec i3
