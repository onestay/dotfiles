#!/usr/bin/bash

set -euo pipefail

if [[ $(id -u) -ne 0 ]]; then
    echo "Backup script has to be run as root"
    exit 1
fi

if ! mount | awk '{if ($3 == "/mnt/user-backup" && $1 == "//user-backup.knut.univention.de/home") {exit 0}} ENDFILE{exit -1}'; then
    echo "mounting backup dir"
    mount -t cifs //user-backup.knut.univention.de/home /mnt/user-backup -o credentials=/home/mmeschter/.backup_creds,domain=knut,iocharset=utf8,vers=2.0
    echo "backup dir mounted to /mnt/user-backup/"
fi

if ! [[ -d /mnt/user-backup/borg ]]; then
    echo "Failed to mount backup directory"
    exit 1
fi

echo "starting borg backup"

cd /home

borg -v \
    create \
    -s --progress \
    --exclude-caches --exclude-nodump \
    "/mnt/user-backup/borg::{now}-{hostname}" \
    "mmeschter"
