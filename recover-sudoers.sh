#!/bin/bash

# backup file
BASE=$(md5sum /Users/irteamsu/scripts/sudoers-backup | awk '{print $1}')
# Change file
NEW=$(md5sum /etc/sudoers | awk '{print $1}')

if [ "${BASE}" != "${NEW}" ]; then
    echo "$0 The file has been changed. Replace it with a backup file."
    echo 'irteamsu' | sudo -kS /bin/cp -f /Users/irteamsu/scripts/sudoers-backup /etc/sudoers
fi
