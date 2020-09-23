#!/bin/bash
ROOT_DIR="/usr/local/lib/netstat/logs/"
LOG_DIR="$ROOT_DIR$(date +%F)/" && mkdir -p ${LOG_DIR}
FILE_NAME=${LOG_DIR}/dig.$(date +%F_%H-%M-%S).log

## Include Houston Area ONLY IP
# ip_addresses=(1.1.1.1 1.0.0.1 8.8.8.8 8.8.4.4 208.67.222.222 208.67.220.220 68.94.157.1)

## US based IP List
ip_addresses=(1.1.1.1 1.0.0.1 8.8.8.8 8.8.4.4 208.67.222.222 208.67.220.220)

ip_index=$(( $(expr $(date +%s) + $RANDOM) % ${#ip_addresses[@]} ))
target_ip=${ip_addresses[$ip_index]}

## Run this for an hour, lookup every 3 seconds
for i in {1..1200}; do
  response_time=$(/usr/bin/dig +time=1 @$target_ip google.com | grep 'timed out\|Query' |  awk '{print $4}' | sed 's/out;/-/g')
  echo `date +%FT%H:%M:%SZ` DNS $target_ip $response_time
  echo `date +%FT%H:%M:%SZ` DNS $target_ip $response_time >> $FILE_NAME 2>> $FILE_NAME
  sleep 3;
done


## Clear logs from 30 days ago
find ${ROOT_DIR}/ -ctime +30 -delete
