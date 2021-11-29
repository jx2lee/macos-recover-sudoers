#!/bin/bash

MD5SUM_BIN=$(which md5sum)

# Backup & change file
BASE=$(echo 'irteamsu' | sudo -kS -u irteam "$MD5SUM_BIN" /Users/irteamsu/scripts/sudoers-backup | awk '{print $1}')
NEW=$($MD5SUM_BIN /etc/sudoers | awk '{print $1}')

datetime=$(date +%Y%m%d-%H%M%S)
if [ "${BASE}" != "${NEW}" ]; then
    echo "$datetime: $0: The file has been changed. Replace it with a backup file."
    /bin/cp -f /Users/irteamsu/scripts/sudoers-backup /etc/sudoers
fi

echo "$0: Done."
