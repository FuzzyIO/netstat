# NetStat
Quick way to get historical Network stability statics with Bash

### Basic Setup

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

Run it as root user (not recommended)
```bash
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

### Known design limitations
* root folder is hardcoded to `/usr/local/lib/netstat/` in the scripts, you may change this as you see fit.

