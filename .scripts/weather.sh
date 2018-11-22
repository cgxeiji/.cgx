#!/usr/bin/sh

info=$(
    curl -s "wttr.in/Tsukuba?0QT" | 
    cut -c 16-)

cast=$(
    echo "$info" |
    sed -n 1p)

temp=$(
    echo "$info" |
    sed -n 2p |
    grep -o .*C)

rain=$(
    echo "$info" |
    sed -n 5p |
    grep -o .*mm)

# Icon Table using Weather Icons
[[ $(date +%H) < 18 ]] && {
    # Daytime
    [[ "$cast" =~ "Clear" ]] && cast=$(echo -n ) ||
    [[ "$cast" =~ "Sunny" ]] && cast=$(echo -n ) ||
    [[ "$cast" =~ "Partly cloudy" ]] && cast=$(echo -n ) ||
    [[ "$cast" =~ "Cloudy" ]] && cast=$(echo -n ) ||
    [[ "$cast" =~ "Shallow Fog" ]] && cast=$(echo -n )
} || {
    # Nighttime
    [[ "$cast" =~ "Clear" ]] && cast=$(echo -n ) ||
    [[ "$cast" =~ "Sunny" ]] && cast=$(echo -n ) ||
    [[ "$cast" =~ "Partly cloudy" ]] && cast=$(echo -n ) ||
    [[ "$cast" =~ "Cloudy" ]] && cast=$(echo -n ) ||
    [[ "$cast" =~ "Shallow Fog" ]] && cast=$(echo -n )
}
[[ "$rain" == "0.0 mm" ]] && 
    rain=$(echo "") || 
    rain=$(echo "  %{T6}%{T-} $rain")

# Manually set font for polybar
echo "%{T6}$cast%{T-} $temp$rain"
