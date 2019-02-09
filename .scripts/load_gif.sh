#!/bin/bash

pkill -f "mpv --x11-name wallpapergif"
sleep 1

xwinwrap -ov -g 1366x768 -- mpv --x11-name wallpapergif -wid WID ~/.cgx/img/wallpaper.mp4 --no-osc --no-osd-bar --loop-file --player-operation-mode=cplayer --no-audio --panscan=1.0 --no-input-default-bindings
