#!/bin/bash

main() {
    echo "Waking up monkeys to look for: $@"

    page="$(curl -s 'https://search.crossref.org/?q='$(echo "$@" | sed 's/ /+/g'))"
    #echo "$page" | tr -d '\n' | grep -o "class='item-data'[^%]*" | grep -o "Authors:[^<]*\|title\|item-data" 
    #| sed -n '/lead/{n;p;}' | sed 's/ctx//g; s/Authors: //g'
    #echo "$page" | tr -d '\n' | grep -o "class='cite-link'[^>]*" | grep -o ", '[^']*" | sed -e 's/$/                                        /g' | cut -c 4-40 | sed 's/$/ \|/g'

    links=("" $(echo "$page" | grep -o "class='cite-link'[^>]*" | grep -o ".org/[^']*" | cut -c 6-))
    titles=$(echo "$page" | grep -o "class='cite-link'[^>]*" | grep -o ", '[^']*" | sed "s/, '//g; s/$/                                        /g" | cut -c -37 | sed 's/$/ \|/g')
    authors=$(echo "$page" | tr -d '\n' | grep -o "class='item-data'[^%]*" | grep -o "Authors:[^<]*\|title\|item-data" | sed -n '/item-data/{n;p;}' | sed 's/title//g; s/Authors: //g' | sed 's/$/             /g' | cut -c -13 | sed 's/$/ \|/g' )

    [[ 1 != $(echo "$titles" | wc --chars) ]] || {
        echo "The monkeys slipped on a banana and found nothing!"
        exit
    }


    labels=$(paste <(echo "") <(echo "$titles") <(echo "$authors"))

    IFS=$'\n'
    names=($(echo "$labels"))

    PS3="Write the file ID to download: "

    COLUMNS=12
    echo "Files found:"
    echo
    echo -e "ID    \tTitle                                \tAuthor"
    echo -e "======\t=====================================\t============="
    select option in "${names[@]}" "*** SELECT THIS TO EXIT ***";
    do
        case $option in
            "*** SELECT THIS TO EXIT ***")
                echo "The monkeys went to sleep..."
                break ;;
            *)
                echo 
                echo "Target locked on: $option"
                echo "selected: $REPLY"
                echo "Deploying bots to look for the file ""${links[$REPLY]}"
                curl -f -w 'Got: %{filename_effective}\n' -# -O $(curl -s 'http://sci-hub.tw/'"${links[$REPLY]}" | grep location.href | grep -o 'http.*pdf') || {
                    echo "The bots went to Mordor and found nothing!"
                }
                break ;;
        esac
    done
}

main "$@"
