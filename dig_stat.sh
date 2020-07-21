#!/bin/bash
ROOT_DIR="/usr/local/lib/netstat/logs/"
LOG_DIR="$ROOT_DIR$(date +%F)/" && mkdir -p ${LOG_DIR}
FILE_NAME=${LOG_DIR}/dig.$(date +%F_%H-%M-%S).log

## Run this for an hour, lookup every 3 seconds
for i in {1..1200}; do /usr/bin/dig @1.1.1.1 google.com | grep Query | while read line; do echo `date` - $line; done; sleep 3; done >> $FILE_NAME

## Clear logs from 30 days ago
find ${ROOT_DIR}/ -ctime +30 -delete
