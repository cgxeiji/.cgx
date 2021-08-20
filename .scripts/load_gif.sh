#!/bin/sh

#pkill -f "mpv --x11-name wallpapergif"
killall xwinwrap
sleep 1

#xwinwrap -ov -g 1366x768 -- mpv --x11-name wallpapergif -wid WID ~/.cgx/img/wallpaper.mp4 --no-osc --no-osd-bar --loop-file --player-operation-mode=cplayer --no-audio --panscan=1.0 --no-input-default-bindings

xwinwrap -ov -g 1050x1680+0+450 -- mpv --x11-name=wallpapergifv -wid WID "$1" --no-osc --no-osd-bar --loop-file --player-operation-mode=cplayer --no-audio --panscan=1.0 --no-input-default-bindings &

xwinwrap -ov -g 1750x1050+1050+0 -- mpv --x11-name=wallpapergifh -wid WID "$2" --no-osc --no-osd-bar --loop-file --player-operation-mode=cplayer --no-audio --panscan=1.0 --video-pan-y=-0.18 --no-input-default-bindings &
