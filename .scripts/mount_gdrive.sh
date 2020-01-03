#!/bin/zsh

trymount() {\
    smount="$(echo -e "$drives" | rofi -dmenu -p "Select a drive to mount" | awk '{print $1}')"
    #if [-z "$smount"]; then
        #exit 1
    #fi
    google-drive-ocamlfuse -label "$smount" "$HOME/drives/$smount" &&
        notify-send "Mounted GDrive:" "$smount" && exit 0
    #getmp "/mnt -maxdepth 1 -type d"
    #sudo -A mount "$smount" "$mp" && notify-send "$smount mounted to $mp." && exit 0
}

drives="$(echo -e 'CGx\nTsukuba\nPUCP')"

if [ -z "$drives" ]; then
    notify-send "No Google Drive was detected" && exit 1
else
    trymount
fi
