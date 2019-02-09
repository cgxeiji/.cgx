#!/bin/bash

state=$(playerctl status 2>/dev/null)

if [[ "$state" = "Playing" || "$state" = "Paused" ]];
then
    app=$(playerctl metadata mpris:trackid)
    if [[ "$state" = "Playing" ]]; then
        echo -n "%{F#ff}";
    else
        echo -n "%{F#66}";
    fi
    if [ $(echo "$app" | grep -c spotify) -gt 0 ]; then
        echo -n "  ";
    elif [ $(echo "$app" | grep -c videolan) -gt 0 ]; then
        echo -n "  ";
    else
        echo -n "  ";
    fi

    playerctl metadata xesam:title; 
    echo -n "  -  "; 
    playerctl metadata xesam:artist; 
    echo -n "%{F-}";
fi

echo ""
