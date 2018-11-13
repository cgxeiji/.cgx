#!/bin/sh

output=$(drive diff -skip-content-check -quiet ~/gdrive/Scholar 2>&1)
gremote=$(echo "$output" | grep remote | wc -l)
glocal=$(echo "$output" | grep local | wc -l)

if [ "$gremote" -gt 0 ]; then
    echo -n "  $gremote"
fi

if [ "$glocal" -gt 0 ]; then
    echo -n "  $glocal"
fi

echo ""
