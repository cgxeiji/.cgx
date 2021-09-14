#!/bin/sh

bluetoothctl paired-devices | cut -f2 -d' ' |
    while read -r uuid
    do
        info=`bluetoothctl info $uuid`
        if echo "$info" | grep -q "Connected: yes"; then
            if echo "$info" | grep -q "WH-1000XM3"; then
                echo -n "󰋋󰂱 "
            fi
            if echo "$info" | grep -q "Name: Soundcore Liberty Air 2 Pro"; then
                echo -n "󰟅󰂱 "
            fi
        fi
    done

    echo ""
