#!/usr/bin/bash

set -euo pipefail

if [[ $(id -u) -ne 0 ]]; then
    echo "Backup script has to be run as root"
    exit 1
fi

rmmod atkbd
modprobe atkbd
