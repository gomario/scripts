#!/bin/bash

WGET="/usr/bin/wget"
while true;do
        $WGET -q --tries=20 --timeout=10 http://www.google.com -O   /tmp/google.idx &> /dev/null
        if [ ! -s /tmp/google.idx ]
        then
          #echo "Not Connected..! $(hostname)"| mail -s "Not connected $(hostname) $(date)" root
          echo "Not Connected..! $(hostname)"| mail -s "Not connected $(hostname) $(date)" root

        else
          echo "Connected..!"
        fi
        sleep 30
	rm /tmp/google.idx
done
