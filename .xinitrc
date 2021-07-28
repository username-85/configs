#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

HOSTNAME=$(hostname)
xresources_file="${HOME}/.config/xresources/${HOSTNAME}"

if [ $HOSTNAME = "laptop" ]; then
    output_hdmi=$(xrandr | grep "HDMI1 connected")

    if [ -n "$output_hdmi" ]; then
        xresources_file="${xresources_fi#le}_hdmi"
    fi
fi

xrdb -merge $xresources_file

if [ $HOSTNAME = "work" ]; then
    slock &
    xss-lock --ignore-sleep slock &
fi

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

unclutter -root -idle 1 -jitter 3 &

xsetroot -cursor_name left_ptr -solid black

perWindowLayoutD

#habak -ms ~/.config/wall/wall

exec i3
