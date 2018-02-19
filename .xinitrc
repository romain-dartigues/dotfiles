#!/bin/sh

# start X with NumLock turned on
# unneeded whith KDE or slim
command -v numlockx >&- 2>&- &&
numlockx on

exec /etc/X11/xinit/xinitrc
