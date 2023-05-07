#!/usr/bin/bash
#

#polybar-msg cmd quit
killall -q polybar
#if type xrandr; then
#	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#		echo "---" | tee -a /tmp/polybar-"$m".log
#		MONITOR=$m polybar --reload bar 2>&1 | tee -a /tmp/polybar-"$m".log &
#		disown
#	done
#else
#	polybar bar 2>&1 | tee -a /tmp/polybar.log &
#fi

polybar main 2>&1 | tee -a /tmp/polybar-DP-2.log &
polybar secondary 2>&1 | tee -a /tmp/polybar-DP-0.log &

echo "bars launched"
