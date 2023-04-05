#!/bin/bash
# Script to handle adding/removing monitor using HDMI splitter.
#
# TODO at some point detect which output is being used using --listmonitors,
# for now xrandr ignores invalid input so just try each output.

if [[ $1 == "add" ]]; then
	xrandr --output DP-1-1 --right-of eDP-1 --auto
        xrandr --output DP-1-2 --left-of eDP-1 --auto

	xrandr --output DP-2-1 --right-of eDP-1 --auto
        xrandr --output DP-2-2 --left-of eDP-1 --auto

	xrandr --output DP-3-1 --right-of eDP-1 --auto
	xrandr --output DP-3-2 --left-of eDP-1 --auto

	xrandr --output DP-1-1 --scale 1.25x1.25
	xrandr --output DP-2-1 --scale 1.25x1.25
	xrandr --output DP-3-1 --scale 1.25x1.25
elif [[ $1 == "remove" ]]; then
	xrandr --output DP-1-1 --off
	xrandr --output DP-1-2 --off

	xrandr --output DP-2-1 --off
	xrandr --output DP-2-2 --off

	xrandr --output DP-3-1 --off
	xrandr --output DP-3-2 --off
fi
