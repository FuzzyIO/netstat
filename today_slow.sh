#!/bin/bash

(cat /usr/local/lib/netstat/logs/$(date +%F)/fping.*.log | grep ": -" | awk '{print $2,$3,$4,$10,$8}';
cat /usr/local/lib/netstat/logs/$(date +%F)/fping.*.log | sort -rn -k10,10 | head -n 20 | awk '{print $2,$3,$4,$10,$8}';
cat /usr/local/lib/netstat/logs/$(date +%F)/dig.*.log | grep 'timed out' | awk '{print $2,$3,$4,$10,$11}';
cat /usr/local/lib/netstat/logs/$(date +%F)/dig.*.log | sort -rn -k11,11 | head -n 20 | awk '{print $2,$3,$4,$11,$9}') |  sort -n -k3,3

