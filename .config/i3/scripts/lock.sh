#!/bin/bash

# Delete temporal file
rm /tmp/i3lock.png
# New temporal file
img=/tmp/i3lock.png

scrot $img
convert $img -scale 10% -scale 1000% $img

i3lock -u -i $img
