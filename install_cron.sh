#!/bin/bash

crontab -l | grep -q 'fping_stat' || crontab -l | { cat; echo '0 * * * * /volumes/netstat/fping_stat.sh >> /tmp/netstat_fping.log 2>&1'; } | crontab -
crontab -l | grep -q 'dig_stat' || crontab -l | { cat; echo '0 * * * * /volumes/netstat/dig_stat.sh >> /tmp/netstat_dig.log 2>&1'; } | crontab -