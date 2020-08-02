#!/bin/bash

ROOT_FOLDER=/usr/local/lib/netstat/logs/$(date -d "24 hours ago" +%F)

(cat $ROOT_FOLDER/fping.*.log | grep " -" | awk '{print $1,$2,"\t",$4,"     \t",$3}';
cat $ROOT_FOLDER/fping.*.log | sort -rn -k4,4 | head -n 15 | awk '{print $1,$2,"\t",$4,"     \t",$3}';
cat $ROOT_FOLDER/dig.*.log | grep " -" | awk '{print $1,$2,"\t",$4,"     \t",$3}';
cat $ROOT_FOLDER/dig.*.log | sort -rn -k4,4 | head -n 15 | awk '{print $1,$2,"\t",$4,"     \t",$3}';) |  sort -n -k1,1
