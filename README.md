# NetStat
Quick way to get historical Network stability statics with Bash

### Basic Setup

Install the tools
```bash
sudo apt-get 
```
Run the following as your own user with sudo privileges
```bash
mkdir -p /volumes
chown ${USER}:${USER} /volumes
```

```
cd /volumes
git clone https://github.com/FuzzyIO/netstat.git 

```

### Known design limitations
* root folder is hardcoded 

