#!/bin/sh

if ! n=$(checkupdates 2> /dev/null | wc -l); then
    n=0
fi

if [ "$n" -gt 0 ]; then
    echo "$n"
else
    echo ""
fi
