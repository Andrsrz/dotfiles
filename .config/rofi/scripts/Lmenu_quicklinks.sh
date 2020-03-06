#!/bin/bash

rofi_command="rofi -theme themes/menu/Lquicklinks.rasi"

# Links
duckduckGo=""
archwiki=""
stackoverflow=""
github=""
calendar=""
podcast=""
japanese=""
reddit=""
whatsapp=""
messenger=""
youtube=""
netflix="ﱄ"

# Variable passed to rofi
options="$duckduckGo\n$archwiki\n$stackoverflow\n$github\n$calendar\n$podcast\n$japanese\n$reddit\n$whatsapp\n$messenger\n$youtube\n$netflix"

chosen="$(echo -e "$options" | $rofi_command -p "Open In : Firefox" -dmenu -selected-row 0)"
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
	$podcast)
		firefox --new-tab https://play.pocketcasts.com/podcasts
		;;
	$japanese)
		firefox --new-tab https://www.lingodeer.com/learn-languages/jp/en/learn-japanese-online
		;;
    $reddit)
        firefox --new-tab https://www.reddit.com
        ;;
	$whatsapp)
		firefox --new-tab https://web.whatsapp.com/
		;;
    $messenger)
        firefox --new-tab https://www.facebook.com/messages/t/frida.baltazar.3
        ;;
    $youtube)
        firefox --new-tab https://www.youtube.com/feed/subscriptions
        ;;
	$netflix)
		firefox --new-tab https://www.netflix.com/browse
		;;
esac

