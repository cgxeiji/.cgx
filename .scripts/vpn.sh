#!/bin/sh

nordvpn status | awk '{if(NR==3 || NR==4 || NR==5) print $NF}' | tr "\n" " " | awk '{printf("VPN: %s, %s (%s)",$1, $2, $3)}'
