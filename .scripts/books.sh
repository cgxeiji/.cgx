#!/bin/zsh

main() {
    echo "Waking up monkeys to look for: $@"

    page=$(curl -s 'http://libgen.io/search.php?req='$(echo "$@" | sed 's/ /+/g')'&open=0&res=25&view=simple&phrase=1&column=def')

    titles=$(echo $page | grep -o "title='' id=[^<]*" | sed 's/.*>//g;
    s/$/                                            /g' | cut -c -44 | sed -e 's/$/.../g')

    [[ 1 != $(echo "$titles" | wc --chars) ]] || (echo "Nothing found!" && exit)

    sizes=$(echo $page | grep -o ">.*MB\|>.*kB" | tr -d '>')
    exts=$(echo $page | grep -A1 ">.*MB\|>.*kB" | grep -v ">.*MB\|>.*kB\|--" | grep -o ">.*<" | tr -d '><')
    files=($(echo $page | grep 'a href' | grep -o "libgen.io/ads[^\']*") )

    labels=$(paste <(echo "$titles") <(echo "$sizes") <(echo "$exts"))

    IFS=$'\n'
    names=($(echo "$labels"))

    PS3="Select a file to download: "

    COLUMNS=12
    echo "Files found:"
    select option in "${names[@]}" "exit";
    do
        case $option in
            "exit")
                echo Cancelled
                break ;;
            *)
                echo 
                echo Fetching: $option
                echo "deploying bots to look for the file..."
                curl -f -w 'Got: %{filename_effective}\n' -# -O -J -L $(curl -s 'http://download1.'${files[$REPLY]} | grep 'a href' | grep -m 1 -o "http://dl[^\']*") || echo Nothing found!
                break ;;
        esac
    done
}

main "$@"
