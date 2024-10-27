#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

HOSTNAME=$(uname -n)

xrdb -load "${HOME}/.config/xresources/config"

if [ "$HOSTNAME" = "work" ]; then
    slock
    xss-lock --ignore-sleep "slock" &
    st &
    st -e sh -c "cat ${HOME}/.issue; $SHELL" &
fi

xset +dpms # enable dpms
xset dpms 900 1200 1500 #blank, suspend,poweroff

mkdir -p /tmp/downloads
mkdir -p /tmp/misc
mkdir -p /tmp/music
mkdir -p /tmp/mutt

autocutsel -fork &
autocutsel -selection PRIMARY -fork &
dunst &
xmousepasteblock &

"$HOME/.bin/misc/init_kbd.sh"

exec i3
