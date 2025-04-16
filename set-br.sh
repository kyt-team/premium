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

curl https://rclone.org/install.sh | bash

printf "q\n" | rclone config

wget --no-check-certificate -O /root/.config/rclone/rclone.conf "https://raw.githubusercontent.com/osjekwknwjsk/awikwok/main/rclone.conf"

git clone  https://github.com/magnific0/wondershaper.git

cd wondershaper

make install

cd

rm -rf wondershaper

echo > /home/limit

# Installatin SMTP

apt install msmtp-mta ca-certificates bsd-mailx -y

cat > /etc/msmtprc  << END

defaults

port 587

tls on

tls_trust_file /etc/ssl/certs/ca-certificates.crt

auth on

logfile        ~/.msmtp.log

# Account Configuration

account      william

host         smtp.gmail.com

port         587

from         Successfull Backup VPS

user         asistenwilliam@gmail.com

password     eansvvlczedwkags

account default : william

END

chown -R www-data:www-data /etc/msmtprc

# Downloading Menu

cd /usr/bin

wget --no-check-certificate -O autobackup "https://raw.githubusercontent.com/osjekwknwjsk/awikwok/main/autobackup.sh"

wget --no-check-certificate -O strt "https://raw.githubusercontent.com/osjekwknwjsk/awikwok/main/strt.sh"

wget --no-check-certificate -O limit-speed "https://raw.githubusercontent.com/osjekwknwjsk/awikwok/main/limit-speed.sh"

chmod +x autobackup

chmod +x backup

chmod +x bckp

chmod +x restore

chmod +x strt

chmod +x limit-speed

chmod +x /root/.config/rclone/rclone.conf

cd

rm -f /root/set-br.sh

