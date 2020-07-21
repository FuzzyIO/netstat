#!/bin/bash

ROOT_DIR="/usr/local/lib/netstat/logs/"
LOG_DIR="$ROOT_DIR$(date +%F)/" && mkdir -p ${LOG_DIR}
FILE_NAME=${LOG_DIR}/fping.$(date +%F_%H-%M-%S).log

## Run this for an hour, ping per each 3 seconds
for i in {1..1200}; do
  ## timeout of 568ms for ping
  rm -f /tmp/fping.tmp && fping -C1 -t568 4.2.2.1 >> /tmp/fping.tmp 2>> /tmp/fping.tmp
  tail /tmp/fping.tmp -n 1 | while read line; do echo `date` - $line >> $FILE_NAME 2>> $FILE_NAME ; done;
  rm -f /tmp/fping.tmp
  sleep 3;
done

## Clear logs from 30 days ago
find ${ROOT_DIR}/ -ctime +30 -delete
