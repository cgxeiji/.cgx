#!/bin/sh

tryupload() {\
    if [ $(echo "$boards" | wc -l) -eq 1 ]; then
        board="$boards"
    else
        board="$(echo -e "$boards" | rofi -dmenu -p "Select a board")"
    fi
    if [ -z "$board" ]; then
        exit 1
    else
        port="$(echo "$board" | awk '{print $1}')"
        if [ -z "$(echo "$port" | awk '$0~"USB"{print $0}')" ]; then
            core="$(echo "$board" | awk '{print $NF}')"
        else
            core="$(head -n1 *.ino | awk '$2~"CORE"{print $3}')"
        fi
        if [ -z "$core" ]; then
            core="$(selectcore)" || exit 1
            #echo "Could not verify core" && exit 1
        fi
        echo "Compiling with: $core"
        arduino-cli compile --fqbn "$core" &&

        echo -e "\nUploading to: $port" &&
        arduino-cli upload -p "$port" --fqbn "$core" &&
        echo "done"
    fi
}

selectcore() {\
    core="$(arduino-cli board listall | tail -n+2 | grep -v -e '^[[:space:]]*$' | rofi -dmenu -p "Select a core")"
    core="$(echo "$core" | awk '{print $NF}')"
    if [ -z "$core" ]; then
        exit 1
    fi
    echo "$core"
}

raw="$(arduino-cli board list)"
#out="$(echo "$raw" | cut -c $(echo "$raw" | head -n1 | awk '{print index($0, "Board")}')-)"
boards="$(echo "$raw" | awk '$NF~":"{printf "%s > %s\n", $(1), $(NF-1)}')"
usbs="$(echo "$raw" | awk '$1~"USB"{printf "%s > %s\n", $(1), "Board not recognized"}')"

boards="$(echo -e "$boards\n$usbs" | grep -v -e '^[[:space:]]*$')"

#echo "$boards"

if [ -z "$boards" ]; then
    notify-send "No Arduino boards detected" && exit 1
else
    tryupload
fi
