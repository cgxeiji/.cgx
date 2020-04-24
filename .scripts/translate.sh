#!/bin/sh

lang="$(xclip -o | trans -identify -no-ansi | head -n 1)"
txt="$(xclip -o | trans -b -j)"

notify-send "Translate $lang" "$txt"
