#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

HOSTNAME=$(uname -n)

xrdb -load "${HOME}/.config/xresources/config"

if [ "$HOSTNAME" = "work" ]; then
    locker="${HOME}/.bin/misc/slock"
    "$locker"
    xss-lock --ignore-sleep "$locker" &
    st &
    st -e sh -c "cat ${HOME}/.issue; $SHELL" &
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
xmousepasteblock &

exec i3
