#!/bin/zsh

getmp() {\
    [ -z "$smount" ] && exit 1
    mp="$(find $1 | rofi -dmenu -i -p "Type mount point")"
    [ "$mp" = "" ] && exit 1
    if [ ! -d "$mp" ]; then
        ismd=$(echo -e "No\nYes" | rofi -dmenu -p "$mp does not exist. Create it?")
        [ "$ismd" = "Yes" ] && (mkdir -p "$mp" || sudo -A mkdir -p "$mp")
    fi
}

trymount() {\
    smount="$(echo -e "$drives" | rofi -dmenu -p "Select a drive to mount" | awk '{print $1}')"
    notify-send "$(udisksctl mount -b "$smount")" && exit 0
    #getmp "/mnt -maxdepth 1 -type d"
    #sudo -A mount "$smount" "$mp" && notify-send "$smount mounted to $mp." && exit 0
}

drives="$(lsblk -rpo "name,label,size,type,mountpoint" | awk '$1!~"sda"&&$4=="part"&&$5==""{printf "%s > %s (%s)\n",$1,$2,$3}')"

if [ -z "$drives" ]; then
    notify-send "No USB drive was detected" && exit 1
else
    trymount
fi
