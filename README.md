# NetStat
Quick way to get historical Network stability statics with Bash

## Basic Setup

* Prerequisite: you must have **sudo** access to install packages and create the folders

Setup folders
```bash
# any user with sudo privilege
sudo mkdir -p /usr/local/lib/netstat/
sudo chown ${USER}:${USER} /usr/local/lib/netstat/
```

Install the packages
```bash
# any user with sudo privilege
sudo apt-get update && sudo apt-get install cron dnsutils fping -y
```

*Run it as root user (not recommended)*
```bash
# Run it as root user (not recommended)
mkdir -p /usr/local/lib/netstat/
chown ${USER}:${USER} /usr/local/lib/netstat/
apt-get update && apt-get install cron dnsutils fping -y
```

Get the source file and installing it
```
cd /usr/local/lib/
git clone https://github.com/FuzzyIO/netstat.git /usr/local/lib/netstat

# Install cron for the user
cd /usr/local/lib/netstat
./install_cron.sh

# Place log aggregate script in user home folder
cp *_slow.sh ~/

```

## SHOW ME THE CHEESE. How does this work. 
1. Please wait until at least top of the hour for the cron to start. 
2. The data capture script runs for 60 minutes every hour on top fo the hour.
3. From your home path `~` or `/usr/local/lib/`
4. Type `./today_slow.sh` or `yesterday_slow.sh`


### Known design limitations
* root folder is hardcoded to `/usr/local/lib/netstat/` in the scripts, you may change this as you see fit.

