#!/bin/sh

state=$(playerctl -p spotify status 2>/dev/null)

if [[ "$state" = "Playing" || "$state" = "Paused" ]];
then
    app=$(playerctl -p spotify metadata mpris:trackid 2>/dev/null)
    if [[ "$state" = "Playing" ]]; then
        echo -n "%{F#ff}";
    else
        echo -n "%{F#66}";
    fi
    if [ $(echo "$app" | grep -c spotify) -gt 0 ]; then
        echo -n "󰓇 ";
    elif [ $(echo "$app" | grep -c videolan) -gt 0 ]; then
        echo -n "󰕼 ";
    else
        echo -n "󰂚 ";
    fi

    title=$(echo -n $(playerctl -p spotify metadata xesam:title) | cut -c -40)
    echo -n "$title  -  ";
    echo -n $(playerctl -p spotify metadata xesam:artist);
    echo -n "%{F-}";
fi

echo ""
