#!/bin/bash

rofi_command="rofi -theme themes/menu/apps.rasi"

# Links
codeEditor=""
books=""
music=""
pixelArt=""
chatDiscord="ﭮ"

# Variable passed to rofi
options="$codeEditor\n$books\n$music\n$pixelArt\n$chatDiscord"

chosen="$(echo -e "$options" | $rofi_command -p "Most Used" -dmenu -selected-row 0)"
case $chosen in
	$codeEditor)
		emacs &
		;;
	$books)
		zathura &
		;;
	$music)
		spotify &
		;;
	$pixelArt)
		aseprite &
		;;
	$chatDiscord)
		discord &
		;;
esac

