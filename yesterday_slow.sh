#!/bin/bash

ROOT_FOLDER=/usr/local/lib/netstat/logs/$(date -d "24 hours ago" +%F)

(cat $ROOT_FOLDER/fping.*.log | grep ": -" | awk '{print $2,$3,$4,$10,$8}';
cat $ROOT_FOLDER/fping.*.log | sort -rn -k10,10 | head -n 15 | awk '{print $2,$3,$4,$10,$8}';
cat $ROOT_FOLDER/dig.*.log | grep 'timed out' | awk '{print $2,$3,$4,$12,$13,$8}';
cat $ROOT_FOLDER/dig.*.log | sort -rn -k13,13 | head -n 15 | awk '{print $2,$3,$4,$13,$8,$11}') |  sort -n -k3,3
