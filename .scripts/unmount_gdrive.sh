#!/bin/zsh

tryunmount() {\
    smount="$(echo -e "$drives" | rofi -dmenu -p "Select a drive to unmount" | awk '{print $1}')"
    #sudo -A umount "$smount" && notify-send "$smount unmounted." && exit 0
    fusermount -u "$smount" && notify-send "Unmounted GDrive:" "$smount" && exit 0
}

#drives="$(echo -e 'CGx\nTsukuba\nPUCP')"
drives="$(cat /etc/mtab | awk '$1=="google-drive-ocamlfuse"{printf "%s\n",$2,$2}')"

if [ -z "$drives" ]; then
    notify-send "No mounted Google Drive was detected" && exit 1
else
    tryunmount
fi
