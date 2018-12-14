#!/bin/sh

tryunmount() {\
    smount="$(echo -e "$drives" | rofi -dmenu -p "Select a drive to unmount" | awk '{print $1}')"
    #sudo -A umount "$smount" && notify-send "$smount unmounted." && exit 0
    notify-send "$(udisksctl unmount -b "$smount")" && exit 0
}

drives="$(lsblk -rpo "name,label,size,type,mountpoint" | awk '$1!~"sda"&&$4=="part"&&length($5)>1{printf "%s > %s (%s)\n",$1,$2,$3}')"

if [ -z "$drives" ]; then
    notify-send "No mounted drive was detected" && exit 1
else
    tryunmount
fi

