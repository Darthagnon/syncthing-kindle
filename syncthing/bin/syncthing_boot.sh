#!/bin/sh
col=$((`cat ./bin/COL.txt`))
if pgrep -x syncthing >/dev/null 2>&1; then
    mntroot rw
    cp /mnt/us/extensions/syncthing/config/syncthing.conf /etc/upstart
    mntroot ro
    result="Syncthing will run on Kindle boot  "
else
    mntroot rw
    rm /etc/upstart/syncthing.conf
    mntroot ro
    result="Syncthing not running on Kindle boot X  "
fi
eips $col 3 "$result"
