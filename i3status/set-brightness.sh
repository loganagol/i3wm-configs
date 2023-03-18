#!/bin/bash
# This script is called by i3 keybinds to set brightness via brightnessctl.
# Afterwards, it does math to define brightness as a percentage and writes
# that number to current_brightness. i3status then reads this file and outputs
# its value to the status bar.

curr_percent=$(cat /home/logan/.config/i3status/current_brightness)

if [[ $1 == "up" ]]; then
	if [[ $curr_percent -le 10 ]]; then
		brightnessctl set +1%
	else
		brightnessctl set +10%
	fi
else
	if [[ $curr_percent -le 10 ]]; then
		brightnessctl set 1-%
	else
		brightnessctl set 10-%
	fi
fi

current=$(cat /sys/class/backlight/intel_backlight/brightness)
max=$(cat /sys/class/backlight/intel_backlight/max_brightness)

percentage=$((current * 100 / max))
echo $percentage > /home/logan/.config/i3status/current_brightness
