#!/bin/bash
ROOT_DIR="/usr/local/lib/netstat/logs/"
LOG_DIR="$ROOT_DIR$(date +%F)/" && mkdir -p ${LOG_DIR}
FILE_NAME=${LOG_DIR}/dig.$(date +%F_%H-%M-%S).log

ip_addresses=(4.2.2.1 4.2.2.2 1.1.1.1 1.0.0.1 8.8.8.8 8.8.4.4 208.67.222.222 208.67.220.220 68.94.157.1 209.244.0.3)
ip_index=$(( $(expr $(date +%s) + $RANDOM) % ${#ip_addresses[@]} ))
target_ip=${ip_addresses[$ip_index]}

## Run this for an hour, lookup every 3 seconds
for i in {1..1200}; do /usr/bin/dig +time=1 @$target_ip google.com | grep 'timed out\|Query' | while read line; do echo `date` - $line; done; sleep 3; done >> $FILE_NAME

## Clear logs from 30 days ago
find ${ROOT_DIR}/ -ctime +30 -delete
