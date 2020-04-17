#!/bin/bash

rofi_command="rofi -theme themes/menu/quicklinks.rasi"

# Links
duckduckGo=""
archwiki=""
stackoverflow=""
github=""
calendar=""

# Variable passed to rofi
options="$duckduckGo\n$archwiki\n$stackoverflow\n$github\n$calendar"

chosen="$(echo -e "$options" | $rofi_command -p "in Firefox" -dmenu -selected-row 0)"
case $chosen in
    $duckduckGo)
        firefox --new-tab https://www.duckduckgo.com
        ;;
    $archwiki)
        firefox --new-tab https://www.archlinux.org/
        ;;
    $stackoverflow)
        firefox --new-tab https://stackoverflow.com/
        ;;
    $github)
        firefox --new-tab https://www.github.com/Andrsrz
        ;;
    $calendar)
        firefox --new-tab https://calendar.google.com
        ;;
esac

