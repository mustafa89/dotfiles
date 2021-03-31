#! /bin/bash
/home/mum/.screenlayout/externaloff.sh
sleep 1
gnome-terminal -e "cmatrix -b" &
sleep 1
i3-msg fullscreen
sleep 0.5
i3lock -n -t
i3-msg kill
sleep 0.5
/home/mum/.screenlayout/screenlayout.sh
