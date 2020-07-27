#!/bin/bash

ROOT_FOLDER=/usr/local/lib/netstat/logs/$(date +%F)

(cat $ROOT_FOLDER/fping.*.log | grep ": -" | awk '{print $2,$3,$4,"PING\t",$10,"     \t",$8}';
cat $ROOT_FOLDER/fping.*.log | sort -rn -k10,10 | head -n 15 | awk '{print $2,$3,$4,"PING\t",$10,"     \t",$8}';
cat $ROOT_FOLDER/dig.*.log | grep 'timed out' | awk '{print $2,$3,$4,"DNS\t","-","     \t",$8}';
cat $ROOT_FOLDER/dig.*.log | sort -rn -k13,13 | head -n 15 | awk '{print $2,$3,$4,"DNS\t",$13,"     \t",$8}') |  sort -n -k3,3
