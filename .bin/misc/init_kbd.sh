#!/bin/sh

#TODO add this script to udev hooks
setxkbmap -layout us,ru -option "altwin:ctrl_alt_win,grp_led:caps,caps:escape"
xmodmap ~/.config/Xmodmap
