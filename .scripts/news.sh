#!/bin/sh

news=$(rsstail -N -1 -n 10 -u https://www.reddit.com/r/worldnews/.rss 2>/dev/null | sed -e 's/$/ | /') && echo -e "$news" |
    tr -s "\n" " " |
    zscroll -l 60 -d 0.1 -p "  ---  " -b "[ " -a " ]" -t 3600 || echo "[ No feeds found ]"
#(rsstail -N -1 -n 10 -u https://www.reddit.com/r/worldnews/.rss | tr -s "\n" "|" | zscroll -l 60 -d 0.1 -b "[ " -a " ]" -t 3600)
