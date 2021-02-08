#!/bin/bash

rpcbind
mount -t nfs 192.168.13.5:/mnt/HD/HD_a2 /nas_a2 -o rw,timeo=600

while true
do
    difference=$(($(date -d "00:20" +%s) - $(date +%s)))
    
    echo "Sleeping until next 00:20..."
    if [ $difference -lt 0 ]
    then
        sleep $((86400 + difference))
    else
        sleep $difference
    fi
    
    echo "Make site at `date`"
    /home/pi/make_site.sh
    
done