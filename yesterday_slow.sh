#!/bin/bash

(cat /usr/local/lib/netstat/logs/$(date -d "24 hours ago" +%F)/fping.*.log | grep ": -" | awk '{print $2,$3,$4,$10,$8}';
cat /usr/local/lib/netstat/logs/$(date -d "24 hours ago" +%F)/fping.*.log | sort -rn -k10,10 | head -n 10 | awk '{print $2,$3,$4,$10,$8}';
cat /usr/local/lib/netstat/logs/$(date -d "24 hours ago" +%F)/dig.*.log | grep 'timed out' | awk '{print $2,$3,$4,$12,$13,$8}';
cat /usr/local/lib/netstat/logs/$(date -d "24 hours ago" +%F)/dig.*.log | sort -rn -k13,13 | head -n 10 | awk '{print $2,$3,$4,$13,$8,$11}') |  sort -n -k3,3
