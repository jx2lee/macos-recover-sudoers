#!/bin/bash

# Backup & change file
BASE=$(/usr/loca/bin/md5sum /Users/irteamsu/scripts/sudoers-backup | awk '{print $1}')
NEW=$(/usr/loca/bin/md5sum /etc/sudoers | awk '{print $1}')

datetime=$(date +%Y%m%d-%H%M%S)
if [ "${BASE}" != "${NEW}" ]; then
    echo "$datetime: $0: The file has been changed. Replace it with a backup file."
    /bin/cp -f /Users/irteamsu/scripts/sudoers-backup /etc/sudoers
    echo "$datetime: $0: Done."
fi
