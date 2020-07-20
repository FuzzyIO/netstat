# NetStat
Quick way to get historical Network stability statics with Bash

### Basic Setup

Install the tools
```bash
## in sudo ##
apt-get update && apt-get install cron dnsutils fping -y

sudo apt-get update && sudo apt-get install cron dnsutils fping -y
```
Run the following as your own user with sudo privileges
```bash
mkdir -p /volumes
chown ${USER}:${USER} /volumes

sudo mkdir -p /volumes
sudo chown ${USER}:${USER} /volumes
```

```
cd /volumes
git clone https://fuzzyio@github.com/FuzzyIO/netstat.git 


cd /volumes/netstat
crontab cron
cp *_slow.sh ~/
```

### Known design limitations
* root folder is hardcoded 

