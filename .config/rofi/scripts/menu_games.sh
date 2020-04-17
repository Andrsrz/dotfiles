#!/bin/bash

rofi_command="rofi -theme themes/menu/games.rasi"

# Links
steam=""
lutris="者"
minecraftLauncher=""
chiaki="邏"

# Variable passed to rofi
options="$steam\n$lutris\n$minecraftLauncher\n$chiaki"

chosen="$(echo -e "$options" | $rofi_command -p "Favorites" -dmenu -selected-row 0)"
case $chosen in
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
