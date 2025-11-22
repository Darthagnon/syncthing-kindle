#!/bin/sh
col=$((`cat COL.txt`))
test_process=$(ps aux | grep "[s]yncthing")
if [ -n "$test_process" ]
then
    result="Syncthing is Running.....  "
else
    result="Syncthing is not running   "
fi
eips $col 3 "$result"
