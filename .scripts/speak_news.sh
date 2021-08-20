#!/bin/sh

text="$(rsstail -N -1 -n 10 -u https://www.reddit.com/r/worldnews/.rss 2>/dev/null | sed -e 's/^/Next news. /')"

talk() {
    curl -G http://localhost:5002/api/tts --data-urlencode "text=$1" --output /tmp/audio.wav && play -q /tmp/audio.wav tempo 1.1 vol 1.25
}

talk "$text" || talk "Sorry, I could not read the news."
