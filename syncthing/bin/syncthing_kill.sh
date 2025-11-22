col=$((`cat COL.txt`))
eips $col 3 "Killing & closing ports...                    "
iptables -D INPUT -i wlan0 -p tcp --dport 8384 -j ACCEPT
iptables -D INPUT -i wlan0 -p tcp --dport 22000 -j ACCEPT
iptables -D INPUT -i wlan0 -p tcp --dport 21025 -j ACCEPT
lipc-send-event com.lab126.hal powerButtonPressed
sleep 5
ps aux | grep [s]yncthing | awk '{print $2}' | xargs -i kill {} > /dev/null
lipc-set-prop -i com.lab126.powerd preventScreenSaver 0
eips $col 1 "                     "
eips $col 3 "                              "