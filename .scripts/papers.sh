#!/bin/bash

main() {
    echo "Waking up monkeys to look for: $@"

    page="$(curl -s 'https://search.crossref.org/?q='$(echo "$@" | sed 's/ /+/g'))"
    
    ilinks=$(echo "$page" |
        grep -o "class='cite-link'[^>]*" |
        grep -o ".org/[^']*" |
        cut -c 6-)

    [[ 1 != $(echo "$ilinks" | wc --chars) ]] || {
        echo "The monkeys slipped on a banana and found nothing!"
        exit
    }

    links=("" $ilinks)
    ilinks=$(echo "$ilinks" |
        cut -c 8-21)
    titles=$(echo "$page" | grep -o "class='cite-link'[^>]*" | 
        grep -o ", '[^']*" | 
        tr -d '\200-\377' | 
        sed "s/, '//g" )
    authors=$(echo "$page" |
        tr -d '\n' |
        grep -o "class='item-data'[^%]*" |
        sed 's/<span class="hl">//g; s/<\/span>//g' |
        grep -o "Authors:[^<]*\|title\|item-data" |
        sed -n '/item-data/{n;p;}' |
        sed 's/title//g; s/Authors: //g' |
        tr '\200-\377' ' ' ) 

    [[ 1 != $(echo "$titles" | wc --chars) ]] || {
        echo "The monkeys slipped on a banana and found nothing!"
        exit
    }


    labels=$(
    paste <(echo "") <(
        echo "$titles" | xargs -d '\n' printf "%-37.37s |\n") <(
        echo "$authors" | xargs -d '\n' printf "%-13.13s |\n") <(
        echo "$ilinks"))

    IFS=$'\n'
    names=($(echo "$labels"))

    PS3=$'\n'"Write the file ID to download (0 to exit): "

    COLUMNS=12
    echo
    echo "Files found:"
    echo
    echo -e "ID    \tTitle                                \tAuthor       \tDOI"
    echo -e "======\t=====================================\t=============\t=============="
    select option in "${names[@]}"
    do
        [[ $REPLY -eq 0 ]] && {
            echo "The monkeys went to sleep..."
            break
        }
        case $option in
            *)
                ititles=($(echo "$titles"))
                echo 
                echo "Target locked on: ""${ititles[$REPLY-1]}"
                echo "Deploying bots to look for the file ""${links[$REPLY]}"
                curl -f -# -O -J $(curl -s 'http://libgen.io/scimag/ads.php?doi='"${links[$REPLY]}"'&downloadname=' | grep -o "http://libgen.io[^\']*") || {
                    echo "The bots went to Mordor and found nothing!"
                }
                #curl -f -w 'Got: %{filename_effective}\n' -# -O $(curl -s 'http://sci-hub.tw/'"${links[$REPLY]}" | grep location.href | grep -o 'http.*pdf') || {
                    #echo "The bots went to Mordor and found nothing!"
                #}
                break ;;
        esac
    done
}

main "$@"
