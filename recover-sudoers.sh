#!/bin/bash

MD5SUM_BIN=$(which md5sum)

# Backup & change file
BASE=$(echo 'irteamsu' | sudo -S -u irteamsu "$MD5SUM_BIN" /Users/irteamsu/scripts/sudoers-backup | awk '{print $1}')
NEW=$(echo 'irteamsu' | sudo -S -u irteamsu "$MD5SUM_BIN" /etc/sudoers | awk '{print $1}')

datetime=$(date +%Y%m%d-%H%M%S)
if [ "${BASE}" != "${NEW}" ]; then
    echo "$datetime: $0: The file has been changed. Replace it with a backup file."
    echo 'irteamsu' | sudo -S -u irteamsu /bin/cp -f /Users/irteamsu/scripts/sudoers-backup /etc/sudoers
    echo "$datetie: $0: Done."
fi
