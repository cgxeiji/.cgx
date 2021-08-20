#!/bin/sh

lang="$(xclip -o | trans -identify -no-ansi | head -n 1)"
txt="$(xclip -o | trans -b -j)"

notify-send "Translate $lang" "$txt"
echo "$txt" > /tmp/speech && pico2wave -w /tmp/speech.wav < /tmp/speech && play -q /tmp/speech.wav gain -2 bass +2 treble +10
