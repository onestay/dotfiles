#!/usr/bin/bash

set -euo pipefail


current_layout=$(setxkbmap -query | grep layout | cut -d" " -f 6)

if [[ $current_layout = "us" ]]; then
    setxkbmap -layout de
else
    setxkbmap -layout us
fi
