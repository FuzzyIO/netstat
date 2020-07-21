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
mkdir -p /usr/local/lib/netstat/
chown ${USER}:${USER} /usr/local/lib/netstat/

sudo mkdir -p /usr/local/lib/netstat/
sudo chown ${USER}:${USER} /usr/local/lib/netstat/
```

```
cd /usr/local/lib/
git clone https://fuzzyio@github.com/FuzzyIO/netstat.git /usr/local/lib/netstat


cd /usr/local/lib/netstat
./install_cron.sh
cp *_slow.sh ~/
```

### Known design limitations
* root folder is hardcoded to `/usr/local/lib/netstat/`

