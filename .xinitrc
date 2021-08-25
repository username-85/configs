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

locker="${HOME}/.bin/misc/slock"

if [ $HOSTNAME = "work" ]; then
    $locker
fi

xss-lock $locker &
xset +dpms # enable dpms
xset dpms 900 1200 1500 #blank, suspend,poweroff

export QT_QPA_PLATFORMTHEME=gtk2
mkdir -p /tmp/downloads
mkdir -p /tmp/misc
mkdir -p /tmp/music
mkdir -p /tmp/mutt

autocutsel -fork &
autocutsel -selection PRIMARY -fork &
dunst &
perWindowLayoutD
picom -b --fade-in-step=1 --fade-out-step=1 --fade-delta=0 --no-fading-openclose --backend glx --vsync --config /dev/null
hsetroot -solid "#001515" &
xsetroot -cursor_name left_ptr &
unclutter -root -idle 1 -jitter 3 &
xte "mousemove 0 0" &

exec i3
