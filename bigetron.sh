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
domain=$(cat /etc/xray/domain)
KEY=$(cat /etc/william/profile/key 2>/dev/null)
CHATID=$(cat /etc/william/profile/chatid 2>/dev/null)
if [[ -z $KEY || -z $CHATID ]]; then
echo ""
echo "Please Activate Limit IP Before Use This Feature !"
exit
fi
user_banned=$(cat /etc/william/udp/listbanned-ssh.conf)
if [[ -z $user_banned ]]; then
echo -e "No SSH Account Got Banned !"
exit
fi
echo -e "=========================="
echo -e "LIST OF BANNED SSH ACCOUNT"
echo -e "=========================="
echo -e "$user_banned"
echo -e "=========================="
echo -e ""
read -p "UNBANNED USER :  " unban
if [[ -z $unban ]]; then
echo -e "Please Input Valid User"
exit
fi
ip_limit_ssh=$(cat /etc/william/limit-ssh/$unban 2>/dev/null)
ngecek_user=$(cat /etc/william/udp/listbanned-ssh.conf | grep -w "$unban")
if [[ -z $ngecek_user ]]; then
echo -e "Please Input Valid User"
exit
fi
passwd -u $unban 2>/dev/null
sed -i "/$unban/d" /etc/william/udp/listbanned-ssh.conf
echo -e "UNBANNED $unban SUCCESS !"
echo -e "NOTIF UNBAN WILL AUTO SEND TO YOUR TELEGRAM"
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="
<b>━━━━━━━━━━━━━━━</b>
<b>UNBAN SSH</b>
<b>━━━━━━━━━━━━━━━</b>
<b>Username: </b><code>$unban</code>
<b>Domain: </b><code>$domain</code>
<b>Limit IP: </b><code>$ip_limit_ssh</code>
<b>Action: </b><code>UNBANNED</code>
<b>━━━━━━━━━━━━━━━</b>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null