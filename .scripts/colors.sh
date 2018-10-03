#!/bin/bash
for((i=0; i<256; i++)); do
    printf "\e[48;5;${i}m%03d" $i;
    printf '\e[0m';
    [ ! $(($i % 10)) -eq 0 ] && printf ' ' || printf '\n'
done
