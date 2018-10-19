#!/bin/bash

main() {
    echo "Waking up monkeys to look for: $@"

    page="$(curl -s 'http://libgen.io/search.php?req='$(echo "$@" | sed 's/ /+/g')'&open=0&res=25&view=simple&phrase=1&column=def')"

    titles=$(echo "$page" | grep -o "title='' id=[^<]*" | sed 's/.*>//g; s/$/                            /g' | cut -c -29 | sed -e 's/$/ \|/g')

    [[ 1 != $(echo "$titles" | wc --chars) ]] || {
        echo "The monkeys slipped on a banana and found nothing!"
        exit
    }

    authors=$(  echo "$page" | grep -o "=author'>[^ ][^<]*" | sed 's/.*>//g; s/$/            /g' | cut -c -13 | sed -e 's/$/ \|/g')
    years=$(    echo "$page" | grep -o "nowrap>[[:xdigit:]]\{,4\}<" | sed 's/.*>//g; s/<//g; s/$/     /g' | cut -c -4 | sed 's/$/ \|/g')
    exts=$(     echo "$page" | grep -A1 ">[[:xdigit:]]* [[:alpha:]]\{,1\}B" | grep -v ">.*B\|--" | grep -o ">.*<" | tr -d '><')
    sizes=$(    echo "$page" | grep -o ">[[:xdigit:]]* [[:alpha:]]\{,1\}B" | tr -d '>' | xargs -d '\n' printf '%6s\n')

    files=($(echo "$page" | grep 'a href' | grep -o "libgen.io/ads[^\']*") )

    labels=$(paste <(echo "") <(echo "$titles") <(echo "$authors") <(echo "$years") <(echo "$exts") <(echo "$sizes"))

    IFS=$'\n'
    names=($(echo "$labels"))

    PS3="Write the file ID to download: "

    COLUMNS=12
    echo "Files found:"
    echo
    echo -e "ID    \tTitle                        \tAuthor       \tYear\tType  \t  Size"
    echo -e "======\t=============================\t=============\t====\t======\t======"
    select option in "${names[@]}" "*** SELECT THIS TO EXIT ***";
    do
        case $option in
            "*** SELECT THIS TO EXIT ***")
                echo "The monkeys went to sleep..."
                break ;;
            *)
                echo 
                echo "Target locked on: $option"
                echo "Deploying bots to look for the file..."
                curl -f -w 'Got: %{filename_effective}\n' -# -O -J -L $(curl -s 'http://download1.'${files[$REPLY]} | grep 'a href' | grep -m 1 -o "http://dl[^\']*") || {
                    echo "The bots went to Mordor and found nothing!"
                }
                break ;;
        esac
    done
}

main "$@"
