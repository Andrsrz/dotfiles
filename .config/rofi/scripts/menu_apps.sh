#!/bin/bash

rofi_command="rofi -theme themes/menu/apps.rasi"

# Links
browser=""
codeEditor=""
IDEAndroid=""
gameEngine="ﮧ"
books=""
music=""
video="嗢"
videoEditor="壘"
pixelArt=""
modeling=""
musicEditor=""
chatDiscord="ﭮ"
steam=""
lutris="者"
minecraftLauncher=""
chiaki="邏"

# Variable passed to rofi
options="$browser\n$codeEditor\n$IDEAndroid\n$gameEngine\n$books\n$music\n$video\n$videoEditor\n$pixelArt\n$modeling\n$musicEditor\n$chatDiscord\n$steam\n$lutris\n$minecraftLauncher\n$chiaki"

chosen="$(echo -e "$options" | $rofi_command -p "Favorites" -dmenu -selected-row 0)"
case $chosen in
	$browser)
		firefox &
		;;
	$codeEditor)
		emacs &
		;;
	$IDEAndroid)
		jetbrains-studio &
		;;
	$gameEngine)
		godot &
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
	$videoEditor)
		obs &
		;;
	$pixelArt)
		aseprite &
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
	$lutris)
		lutris &
		;;
	$minecraftLauncher)
		minecraft-launcher &
		;;
	$chiaki)
		chiaki &
		;;
esac

