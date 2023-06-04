#!/bin/bash

print_help() {
    printf "Usage: fn_keys <category> <cmd>\n\tcategory: vol\n\t\tcmd: <down|up|mute>\n\tcategory: bl\n\t\t<down|up>\n" 
    exit 1
}

if [[ $# -eq 0 ]]; then
    print_help
fi


vol() {
    case "$2" in
        "down") pactl set-sink-volume @DEFAULT_SINK@ -5%
        ;;
        "up") pactl set-sink-volume @DEFAULT_SINK@ +5%
        ;;
        "mute") pactl set-sink-mute @DEFAULT_SINK@ toggle
        ;;
        *) print_help
        ;;
    esac
}

brightness() {
    case "$2" in
        "up") brillo -q -A 2
        ;;
        "down") brillo -q -U 2
        ;;
        *) print_help
        ;;
    esac
}

case "$1" in
    "vol") vol "$@"
        ;;
    "bl") brightness "$@"
        ;;
    *) print_help
        ;;
esac
