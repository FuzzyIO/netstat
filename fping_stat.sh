#!/bin/bash

ROOT_DIR="/usr/local/lib/netstat/logs/"
LOG_DIR="$ROOT_DIR$(date +%F)/" && mkdir -p ${LOG_DIR}
FILE_NAME=${LOG_DIR}/fping.$(date +%F_%H-%M-%S).log

## Include Houston Area ONLY IP
# ip_addresses=(4.2.2.1 4.2.2.2 1.1.1.1 1.0.0.1 8.8.8.8 8.8.4.4 208.67.222.222 208.67.220.220 68.94.157.1 209.244.0.3)

## US based IP List
ip_addresses=(4.2.2.1 4.2.2.2 1.1.1.1 1.0.0.1 8.8.8.8 8.8.4.4 208.67.222.222 208.67.220.220 209.244.0.3)

tmp_file=/tmp/fping_$RANDOM.$RANDOM.log

## Run this for an hour, ping per each 3 seconds
for i in {1..1200}; do
  ip_index=$(( $(expr $(date +%s) + $RANDOM) % ${#ip_addresses[@]} ))
  target_ip=${ip_addresses[$ip_index]}

  ## timeout of 568ms for ping
  rm -f $tmp_file && fping -C1 -t568 $target_ip >> $tmp_file 2>> $tmp_file
  tail $tmp_file -n 1 | while read line; do echo `date` - $line >> $FILE_NAME 2>> $FILE_NAME ; done;
  rm -f $tmp_file
  sleep 3;
done

## Clear logs from 30 days ago
find ${ROOT_DIR}/ -ctime +30 -delete
