#!/bin/sh

#pkill -f "mpv --x11-name wallpapergif"
killall xwinwrap
sleep 1

#xwinwrap -ov -g 1366x768 -- mpv --x11-name wallpapergif -wid WID ~/.cgx/img/wallpaper.mp4 --no-osc --no-osd-bar --loop-file --player-operation-mode=cplayer --no-audio --panscan=1.0 --no-input-default-bindings

# NASA Feed
# xwinwrap -ov -o 0.95 -g 269x228+0+900 -- mpv --x11-name=bggadget -wid WID "https://www.youtube.com/watch?v=EEIk7gwjgIM" --no-osc --no-osd-bar --loop-file --player-operation-mode=cplayer --no-audio --panscan=1.0 --video-pan-y=0.1 --video-pan-x=0.15 --no-input-default-bindings --x11-bypass-compositor=yes --video-zoom=1 &

# Shibuya Feed
xwinwrap -ov -o 0.85 -g 287x91+1470+222 -- mpv --x11-name=bggadget -wid WID "https://www.youtube.com/watch?v=HpdO5Kq3o7Y" --no-osc --no-osd-bar --loop-file --player-operation-mode=cplayer --no-audio --panscan=1.0 --video-pan-y=-0.15 --video-pan-x=-0.1 --no-input-default-bindings --x11-bypass-compositor=yes --video-zoom=1.5 &

sleep 0.5

xwinwrap -ov -ni -g 1050x1680+0+450 -- mpv --x11-name=wallpapergifv -wid WID "$1" --no-osc --no-osd-bar --loop-file --player-operation-mode=cplayer --no-audio --panscan=1.0 --no-input-default-bindings --x11-bypass-compositor=yes &

xwinwrap -ov -ni -g 1750x1050+1050+0 -- mpv --x11-name=wallpapergifh -wid WID "$2" --no-osc --no-osd-bar --loop-file --player-operation-mode=cplayer --no-audio --panscan=1.0 --video-pan-y=-0.18 --no-input-default-bindings --x11-bypass-compositor=yes &
