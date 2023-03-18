#!/bin/bash
# Run this to backup i3wm configs and scripts. Previously done with hard
# links but I had to update links every time I added or removed helper
# scripts from the directories.

cp -r $HOME/.config/i3/ 	$HOME/projects/dot-config-i3wm/i3/
cp -r $HOME/.config/i3status/ 	$HOME/projects/dot-config-i3wm/i3status/
cp -r $HOME/.config/rofi/ 	$HOME/projects/dot-config-i3wm/rofi/
cp -r $HOME/.config/dunst/	$HOME/projects/dot-config-i3wm/dunst/
git add .
git commit -m 'Git push from script.'
git push origin master
