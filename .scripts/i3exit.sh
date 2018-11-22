#!/bin/bash

response=$(echo -e "exit i3\nrestart\nshutdown" | rofi -dmenu)

if [[ $response = "exit i3" ]]; then
    $(i3-msg exit)
fi
if [[ $response = "restart" ]]; then
    sudo reboot
fi
if [[ $response = "shutdown" ]]; then
    sudo poweroff
fi

exit 0
