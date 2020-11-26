#!/bin/bash

killall -q polybar

while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

polybar top1 &

my_laptop_external_monitor=$(xrandr --query | grep "HDMI-1-1")
if [[ $my_laptop_external_monitor = *connected* ]]; then
    polybar top_external &
fi
