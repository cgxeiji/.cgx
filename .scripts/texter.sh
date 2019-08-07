#!/bin/bash

filename=$(mktemp)
#xclip -o > "$filename"

xst -n textterm -e nvim -c "set textwidth=0 | set spell | startinsert" "$filename"

#sleep 1; cat "$filename" | head -c -1 | xdotool type --clearmodifiers --delay 1 --file -
sleep 1; cat "$filename" | head -c -1 | xclip -i -selection "clipboard" && xdotool key --clearmodifiers ctrl+v
rm "$filename"
