#!/bin/sh
xrandr --output eDP-1 --primary --mode 1920x1200 --pos 0x0 --rotate normal
xrandr --output DP-3 --mode 2560x1440 --pos 1920x0 --rotate normal --crtc 1
xrandr --output DP-4 --mode 2560x1440 --pos 4480x0 --rotate normal --crtc 2
#xrandr --output HDMI-1 --off
#xrandr --output DP-1 --off
#xrandr --output DP-1-3 --off
##xrandr --output DP-2 --off
#xrandr --output DP-1-1 --off
