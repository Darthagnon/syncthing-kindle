#!/bin/sh
col=$((`cat ./bin/COL.txt`))
if pgrep -x syncthing >/dev/null 2>&1; then
    result="Syncthing is running.....  "
else
    result="Syncthing is not running X  "
fi
eips $col 3 "$result"
