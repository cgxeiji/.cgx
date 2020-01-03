#!/bin/sh

# Muhenkan to Shift/BackSpace
spmod="Hyper_L"
xmodmap -e "keycode 102 = $spmod"
xmodmap -e "remove mod4 = $spmod"
xmodmap -e "add Shift = $spmod"
xcape -e "$spmod=BackSpace"

# Henkan to Space
xmodmap -e "keycode 100 = space"
# Hiragana/Katakana to Super
xmodmap -e "keycode 101 = Super_L"

# Caps to Control
xmodmap -e "keycode 66 = Control_L"
xmodmap -e "clear Lock"
xmodmap -e "add Control = Control_L"
