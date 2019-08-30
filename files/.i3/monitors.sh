#!/bin/sh

#HTPC
xrandr --output HDMI1 --mode 1920x1080i -r 30 --right-of LVDS1 --primary

#Main
xrandr --dpi 110
xrandr --output DP-1 --auto --right-of HDMI-0 --rotate left
xrandr --output DP-3 --auto --left-of HDMI-0 --rotate right
xrandr --output HDMI-0 --mode 3840x2160 -r 60 --right-of DP-3