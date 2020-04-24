#!/bin/zsh

stat() {
    vpn=$(nordvpn status | awk -F ': ' '{if(NR==3 || NR==4 || NR==5) print $NF}' | tr "\n" ":" | awk -F ':' '{printf("VPN: %s, %s (%s)\n",$1, $2, $3)}')

    if [ -z "$vpn" ]; then
        #echo "(public: $(curl -s ifconfig.me))"
        echo ""
    else
        echo "$vpn"
    fi
}

connect() {
    nordvpn connect "$1"
}

disconnect() {
    nordvpn disconnect
}

sel() {
    country=$(nordvpn countries | tr '\t' '\n' | awk 'NF > 0' | rofi -dmenu -i -p 'Select a country')

    if [ -z "$country" ]; then
    else
        nordvpn connect "$country"
    fi
}

case "$1" in
    status)
        stat
        ;;
    connect)
        connect "$2"
        ;;
    disconnect)
        disconnect
        ;;
    select)
        sel
        ;;
esac
