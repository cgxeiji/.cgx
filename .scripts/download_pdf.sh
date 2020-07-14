#!/bin/sh

main() {
    file="$(echo "$@" | grep '.*pdf$' )"
    if [[ -z "$file" ]]; then
        exit 0
    fi
    notify-send "Checking..." "$file"
    st -e scholar add "$file"
}

source /home/cgx/.zshrc
main "$@"
