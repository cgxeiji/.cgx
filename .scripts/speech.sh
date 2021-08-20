#!/bin/sh

text="$(xclip -o | sed -e 's/$/ /' | sed -e 's/- $//' | tr --delete '\n')"

talk() {
    curl -G http://localhost:5002/api/tts --data-urlencode "text=$1" --output /tmp/audio.wav && play -q /tmp/audio.wav tempo 1.1 vol 1.25
}

talk "$text" || talk "Sorry, I could not read the selection."
