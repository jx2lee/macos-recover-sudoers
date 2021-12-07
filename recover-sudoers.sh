#!/bin/bash

# Detect if a file has changed.
BACKUP=/Users/irteamsu/scripts/macos-recover-sudoers/sudoers-backup
NEW=/etc/sudoers

datetime=$(date +%Y%m%d-%H%M%S)

/usr/bin/diff $BACKUP $NEW > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo "$datetime: $0: The file has been changed. Replace it with a backup file."
    /bin/cp -f /Users/irteamsu/scripts/macos-recover-sudoers/sudoers-backup /etc/sudoers
    echo "$datetime: $0: Done."
    exit 0
fi
