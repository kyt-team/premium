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

source /etc/os-release
VERSI=$VERSION_ID
if [[ $VERSI == '9' ]]; then
echo > /var/log/cloud-init.log
echo > /var/log/landscape/sysinfo.log
echo > /var/log/apt/term.log
echo > /var/log/apt/history.log
echo > /var/log/dpkg.log
echo > /var/log/nginx/error.log
echo > /var/log/nginx/vps-access.log
echo > /var/log/nginx/vps-error.log
echo > /var/log/nginx/access.log
echo > /var/log/ubuntu-advantage-timer.log
echo > /var/log/kern.log
echo > /var/log/cloud-init-output.log
echo > /var/log/fail2ban.log
echo > /var/log/squid/cache.log
echo > /var/log/squid/access.log
echo > /var/log/unattended-upgrades/unattended-upgrades.log
echo > /var/log/unattended-upgrades/unattended-upgrades-shutdown.log
echo > /var/log/unattended-upgrades/unattended-upgrades-dpkg.log
echo > /var/log/alternatives.log
echo > /var/log/accel-ppp/auth-fail.log
echo > /var/log/accel-ppp/accel-ppp.log
echo > /var/log/accel-ppp/emerg.log
echo > /var/log/ubuntu-advantage.log
echo > /var/log/auth.log
echo > /var/log/xray/error2.log
echo > /var/log/xray/error.log
echo > /var/log/xray/access2.log
echo > /var/log/xray/access.log
echo > /var/log/syslog
echo > /var/log/wtmp
echo > /var/log/utmp
echo > /var/log/btmp
echo > /var/log/lastlog
echo > /var/log/error.1
echo > /var/log/error
for CLEAN in $(find /var/log/ -type f)
do
    cp /dev/null  $CLEAN
done
history -c
clear
echo "clear log for debian 9 success"
fi
data=(`find /var/log/ -name *.log`);
for log in "${data[@]}"
do
echo "$log clear"
echo > $log
done
data=(`find /var/log/ -name *.err`);
for log in "${data[@]}"
do
echo "$log clear"
echo > $log
done
data=(`find /var/log/ -name mail.*`);
for log in "${data[@]}"
do
echo "$log clear"
echo > $log
done
echo > /var/log/syslog
echo > /var/log/btmp
echo > /var/log/messages
echo > /var/log/debug
echo > /var/log/xray/error2.log
echo > /var/log/xray/error.log
echo > /var/log/xray/access2.log
echo > /var/log/xray/access.log
echo > /var/log/wtmp
echo > /var/log/utmp
echo > /var/log/lastlog
history -c
for CLEAN in $(find /var/log/ -type f)
do
    cp /dev/null  $CLEAN
done
echo -e "Clear Log Success"