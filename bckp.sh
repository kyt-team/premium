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

DOMAIN=$(cat /etc/v2ray/domain);
clear
IP=$(curl -sS ipinfo.io/ip);
email=$(cat /home/email);
tanggal=$(date +"%d-%m-%Y");
echo Membuat Directory
mkdir /root/backup
sleep 1
echo Start Backup
clear
cp /root/log-install.txt backup/
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp /etc/ppp/chap-secrets backup/chap-secrets
cp /etc/ipsec.secrets backup/ipsec.secrets
cp /etc/ipsec.d/passwd backup/passwd1
cp /usr/local/etc/xray/config.json backup/
cp /usr/local/etc/xray/none.json backup/
cp /usr/local/etc/xray/will69.json backup/
cp /usr/local/etc/xray/will666.json backup/
cp /etc/systemd/system/cdn.service backup/
cp -r /etc/william/ backup/william
cp -r /etc/william/slowdns backup/slowdns
cp -r /etc/ssl/private/ backup/private
cp -r /var/lib/premium-script/ backup/premium-script
cp -r /home/vps/public_html backup/public_html
cp -r /etc/xray/ backup/xray/
cp -r /etc/v2ray/ backup/v2ray/
cp -r /etc/nginx/conf.d/ backup/conf.d/
cd /root
zip -r $IP-$date.zip backup > /dev/null 2>&1
rclone copy /root/$IP-$date.zip william:backup/
url=$(rclone link william:backup/$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
echo -e "The following is a link to your vps data backup file.

Your VPS IP » $IP
Your Domain » $DOMAIN
Tanggal Backup » $tanggal

$link

If you want to restore data, please enter the link above.

Thank You For Using Our Services" | mail -s "Backup Data" $email
rm -rf /root/backup
rm -r /root/$IP-$date.zip
echo "Done"
echo "Please Check Your Email"
