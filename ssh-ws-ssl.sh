#!/bin/bash
if [[ $(ulimit -c) != "0" ]]; then
  echo "Im Watching You..."
  echo "- @user_legend"
  exit 1
fi

red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
IP=$(curl -sS ipinfo.io/ip > /tmp/ipaddress.txt)
MYIP=$(cat /tmp/ipaddress.txt)

# cek wget & curl
if ! which wget > /dev/null; then
clear
echo -e "${red}Wah Mau Belajar Nakal Yah !${NC}"
sleep 2
exit 0
clear
else
echo "Wget is already installed"
fi

if ! which curl > /dev/null; then
clear
echo -e "${red}Wah Mau Belajar Nakal Yah !${NC}"
sleep 2
exit 0
clear
else
echo "curl is already installed"
fi

fileee=/usr/bin/wget
minimumsize=400000
actualsize=$(wc -c <"$fileee")
if [ $actualsize -ge $minimumsize ]; then
clear
echo -e "${green}Checking...${NC}"
else
clear
echo -e "${red}Permission Denied!${NC}";
echo "Reason : Modified Package To Bypass Sc"
exit 0
fi

fileeex=/usr/bin/curl
minimumsizex=15000
clear
actualsizex=$(wc -c <"$fileeex")
if [ $actualsizex -ge $minimumsizex ]; then
clear
echo -e "${green}Checking...${NC}"
else
clear
echo -e "${red}Permission Denied!${NC}";
echo "Reason : Modified Package To Bypass Sc"
exit 0
fi

# data server
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
cekcloudflare=$(curl -sS http://ip-api.com/json | jq .as | grep -o "Cloudflare")
if [[ "$cekcloudflare" = "Cloudflare" ]]; then
cekdomen=$(cat /etc/xray/domain)
MYIP=$(dig +short "$cekdomen" | head -n 1)
fi
repogithub='kyt-team/premium/main'
clear

# step one : install package
mkdir -p /etc/william/
cd /etc/william/
apt install npm -y
clear
source /etc/os-release
OS=$PRETTY_NAME
if [[ $OS == 'Debian GNU/Linux 9 (stretch)' ]]; then
curl -sL https://deb.nodesource.com/setup_14.x | bash
apt-get install -y nodejs
apt upgrade -y
fi
apt install nodejs -y
wget --no-check-certificate -q -O PDirect.js "https://raw.githubusercontent.com/xkjdox/sojsiws/main/ndjdjdjdi.js"
chmod +x PDirect.js
cd

# step two : configurasi sshws+ssl443
cat > /etc/systemd/system/cdn.service << END 
[Unit]
Description=P7COM-nodews1-WILLIAM
Documentation=https://p7com.net/
Documentation=https://t.me/Alvi_cell
After=network.target nss-lookup.target

[Service]
User=nobody
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/node --expose-gc /etc/william/PDirect.js -dhost 127.0.0.1 -dport 109 -mport 2052
Restart=on-failure
RestartSec=3s

[Install]
WantedBy=multi-user.target
END

# Install Ovpn-Websocket
apt install python -y
cd /etc/william/
wget --no-check-certificate -q -O ODirect.py "https://raw.githubusercontent.com/xkjdox/sojsiws/main/PDirectovpn.py"
chmod +x /etc/william/ODirect.py
# Install Service Ovpn-ws
cekubuntu22=$(lsb_release -a 2>/dev/null | awk '/Description/ {print $2, $3}' | cut -d. -f1)
if [[ "$cekubuntu22" = "Ubuntu 22" ]]; then
apt install python2 -y
cat > /etc/systemd/system/cdn-ovpn.service << END 
[Unit]
Description=WS-OPENVPN By william
Documentation=https://t.me/Alvi_cell
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python2 -O /etc/william/ODirect.py 2095
Restart=on-failure

[Install]
WantedBy=multi-user.target
END
else
cat > /etc/systemd/system/cdn-ovpn.service << END 
[Unit]
Description=WS-OPENVPN By william
Documentation=https://t.me/Alvi_cell
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /etc/william/ODirect.py 2095
Restart=on-failure

[Install]
WantedBy=multi-user.target
END
fi

# step three : enable service and reboot eh tapi boong
systemctl enable cdn.service
systemctl start cdn.service
systemctl enable cdn-ovpn.service
systemctl start cdn-ovpn.service

clear
echo "INSTALL COMPLETED ! AUTOREBOOT ON 3 SEC."
sleep 1
echo "1"
sleep 1
echo "2"
sleep 2
echo "3"
echo "eh tapi boong"
sleep 1
rm -rf ssh-ws-ssl.sh
clear
