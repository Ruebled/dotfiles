#!/bin/sh

#userresources=$HOME/.Xresources
#usermodmap=$HOME/.Xmodmap
#sysresources=/etc/X11/xinit/.Xresources
#sysmodmap=/etc/X11/xinit/.Xmodmap
#
## merge in defaults and keymaps
#
#if [ -f $sysresources ]; then
#    xrdb -merge $sysresources
#fi
#
#if [ -f $sysmodmap ]; then
#    xmodmap $sysmodmap
#fi
#
#if [ -f "$userresources" ]; then
#    xrdb -merge "$userresources"
#fi
#
#if [ -f "$usermodmap" ]; then
#    xmodmap "$usermodmap"
#fi
#
#export GTK_IM_MODULE='ibus'
#export QT_IM_MODULE='ibus'
#export XMODIFIERS='@im=ibus'
#ibus-daemon -dr
## start some nice programs
#
#if [ -d /etc/X11/xinit/xinitrc.d ] ; then
# for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
#  [ -x "$f" ] && . "$f"
# done
# unset f
#fi
#
setxkbmap -option ctrl:nocaps &
xrdb $HOME/.Xresources &
exec xmonad

