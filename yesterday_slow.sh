#!/bin/bash

(cat /usr/local/lib/netstat/logs/$(date -d "24 hours ago" +%F)/fping.*.log | grep ": -" | awk '{print $2,$3,$4,$10,$8}';
cat /usr/local/lib/netstat/logs/$(date -d "24 hours ago" +%F)/fping.*.log | sort -rn -k10,10 | head -n 10 | awk '{print $2,$3,$4,$10,$8}';
cat /usr/local/lib/netstat/logs/$(date -d "24 hours ago" +%F)/dig.*.log | grep 'timed out' | awk '{print $2,$3,$4,$10,$11}';
cat /usr/local/lib/netstat/logs/$(date -d "24 hours ago" +%F)/dig.*.log | sort -rn -k11,11 | head -n 10 | awk '{print $2,$3,$4,$11,$9}') |  sort -n -k3,3
