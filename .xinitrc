#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

HOSTNAME=$(uname -n)

cfg_file="${HOSTNAME}"

if [ $HOSTNAME = "laptop" ]; then
    output_hdmi=$(xrandr | awk '/connected/ && /HDMI1/ { print; }' | cut -d " " -f1)

    if [ -n "$output_hdmi" ]; then
        xrandr --output eDP1 --off --output HDMI1 --auto
        cfg_file="${cfg_file}_hdmi"
    fi
fi

xrdb -load "${HOME}/.config/xresources/${cfg_file}"
ln -sf "${HOME}/.config/rofi/${cfg_file}" "${HOME}/.config/rofi/config.rasi"

if [ $HOSTNAME = "work" ]; then
    locker="${HOME}/.bin/misc/slock"
    $locker
    xss-lock --ignore-sleep $locker &
fi

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

xcompmgr -a &

hsetroot -solid "#001515" &
xsetroot -cursor_name left_ptr &
unclutter -root -idle 1 -jitter 3 &
xte "mousemove 0 0" &

exec i3
