#!/bin/bash

# Backup & change file
BASE=$(/usr/local/bin/md5sum /Users/irteamsu/scripts/macos-recover-sudoers/sudoers-backup | awk '{print $1}')
NEW=$(/usr/local/bin/md5sum /etc/sudoers | awk '{print $1}')

datetime=$(date +%Y%m%d-%H%M%S)
if [ "${BASE}" != "${NEW}" ]; then
    echo "$datetime: $0: The file has been changed. Replace it with a backup file."
    /bin/cp -f /Users/irteamsu/scripts/macos-recover-sudoers/sudoers-backup /etc/sudoers
    echo "$datetime: $0: Done."
fi
