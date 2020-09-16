#!/bin/sh

#sinks="$()"

sinks="$(pacmd list-sink-inputs |
    tr '=' ':' |
    awk -F ': ' '{
            if($1 ~ /.*index/) {
                id = $2;
            }
            else if($1 ~ /.*application\.name/){
                name = $2;
                printf "%s\t%s\n", id, name;
            }
        }' |
    tr -d '"')"

id="$(echo -e "$sinks" | rofi -dmenu -i -p "󰲸 Active sources" | awk -F '\t' '{printf $1}')"
if [ -z "$id" ]; then
    exit 1
fi

outputs="$(pacmd list-sinks |
    tr '=' ':' |
    awk -F ': ' '{
            if($1 ~ /.*index/) {
                id = $2;
            }
            else if($1 ~ /.*device\.description/){
                name = $2;
                printf "%s\t%s\n", id, name;
            }
        }' |
    tr -d '"')"

device="$(echo -e "$outputs" | rofi -dmenu -i -p "󰋋 Output sink" | awk -F '\t' '{printf $1}')"
if [ -z "$device" ]; then
    exit 1
fi

pactl move-sink-input $id $device
