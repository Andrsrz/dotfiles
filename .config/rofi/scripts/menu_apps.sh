#!/bin/bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## browser : @adi1090x
## music : @adi1090x

rofi_command="rofi -theme themes/menu/apps.rasi"

# Links
browser=""
terminal=""
codeEditor=""
gameEngine=""
IDEAndroid=""
IDEWeb=""
books=""
music=""
video="嗢"
modeling=""
musicEditor=""
chatDiscord="ﭮ"
steam=""
chiaki="邏"

# Variable passed to rofi
options="$browser\n$terminal\n$codeEditor\n$gameEngine\n$IDEAndroid\n$IDEWeb\n$books\n$music\n$video\n$modeling\n$musicEditor\n$chatDiscord\n$steam\n$chiaki"

chosen="$(echo -e "$options" | $rofi_command -p "Favorites" -dmenu -selected-row 0)"
case $chosen in
    $browser)
        firefox &
        ;;
    $terminal)
        alacritty &
        ;;
    $codeEditor)
        emacs &
        ;;
	$gameEngine)
		godot &
		;;
	$IDEAndroid)
		jetbrains-studio &
		;;
	$IDEWeb)
		code-os &
		;;
	$books)
		evince &
		;;
    $music)
        spotify &
        ;;
	$video)
		vlc &
		;;
	$modeling)
		blender &
		;;
	$musicEditor)
		lmms &
		;;
	$chatDiscord)
		discord &
		;;
	$steam)
		steam-native &
		;;
	$chiaki)
		chiaki &
		;;
esac

