# NetStat
Quick way to get historical Network stability statics with Bash

### Basic Setup
* Prerequisite: you must have sudo access to install packages and create the folders

Install the packages & setup folders
```bash
## any user with sudo privilege ##
sudo apt-get update && sudo apt-get install cron dnsutils fping -y
sudo mkdir -p /usr/local/lib/netstat/
sudo chown ${USER}:${USER} /usr/local/lib/netstat/
```
Run it as root user
```bash
apt-get update && apt-get install cron dnsutils fping -y
mkdir -p /usr/local/lib/netstat/
chown ${USER}:${USER} /usr/local/lib/netstat/
```

Get the source file and installing it
```
cd /usr/local/lib/
git clone https://github.com/FuzzyIO/netstat.git /usr/local/lib/netstat


cd /usr/local/lib/netstat
./install_cron.sh
cp *_slow.sh ~/
```

### Known design limitations
* root folder is hardcoded to `/usr/local/lib/netstat/` in the scripts, you may change this as you see fit.

