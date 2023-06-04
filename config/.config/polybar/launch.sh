#!/usr/bin/bash

#polybar-msg cmd quit
killall -q polybar
if type xrandr; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        echo "$m"
		echo "---" | tee -a /tmp/polybar-"$m".log
        if [[ $m = "eDP-1" ]]; then
		    polybar --config="$HOME"/.config/polybar/config.ini main 2>&1 | tee -a /tmp/polybar-"$m".log &
            disown
        else
            MONITOR=$m polybar --config="$HOME"/.config/polybar/config.ini secondary 2>&1 | tee -a /tmp/polybar-"$m".log &
            disown
        fi
	done
else
	polybar bar 2>&1 | tee -a /tmp/polybar.log &
fi

echo "bars launched"
