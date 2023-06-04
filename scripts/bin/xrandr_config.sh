#!/bin/bash

connected_monitors=$(xrandr | grep -ce ".* connected .*")

if [[ $connected_monitors -eq 3 ]]; then
	~/.screenlayout/docking_station.sh
    bspc monitor "eDP-1" -d 1 2 3
    bspc monitor "DVI-I-2-2" -d 4 5 6
    bspc monitor "DVI-I-1-1" -d 7 8 9
    bspc wm -O "eDP-1" "DVI-I-2-2" "DVI-I-1-1"
	exit 0
fi

if [[ $connected_monitors -eq 2 ]]; then
    ~/.screenlayout/home.sh
    bspc monitor "HDMI-1" -d 6 7 8 9
    bspc monitor "eDP-1" -d 1 2 3 4 5
    bspc wm -O "eDP-1" "HDMI-1"
    exit 0
fi

if [[ $connected_monitors -eq 1 ]]; then
	~/.screenlayout/laptop_only.sh
    bspc monitor -O "eDP-1"
    bspc monitor "eDP-1" -d 1 2 3 4 5 6 7 8 9
	exit 0
fi

xrandr --auto
