#!/bin/bash

rofi_command="rofi -theme themes/menu/bluetooth.rasi"
bt_status=$(systemctl status bluetooth | grep "Active" | cut -d ":" -f2 | cut -d ")" -f1)

# Options
turnon=""
turnoff=""

# Variable passed to rofi
options="$turnon\n$turnoff"

chosen="$(echo -e "$options" | $rofi_command -p "$bt_status" -dmenu -selected-row 2)"
case $chosen in
    $turnon)
        start-bt
        ;;
    $turnoff)
        stop-bt
        ;;
esac

