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

KEY=$(cat /etc/william/profile/key 2>/dev/null)
CHATID=$(cat /etc/william/profile/chatid 2>/dev/null)
if [[ -z $KEY || -z $CHATID ]]; then
echo ""
echo "Please Activate Limit IP Xray Before Use This Feature !"
exit
fi
cek_banned=$(cat /usr/local/etc/xray/config.json | grep "#banned" | awk {'print $1'} | sort -u)
if [[ -z $cek_banned ]]; then
echo -e "No Account Got Banned !"
exit
fi
echo -e "=========================="
echo -e "UNBANNED XRAY ACCOUNT"
echo -e "=========================="
echo -e " [1]. VMESS WS"
echo -e " [2]. VLESS WS"
echo -e " [3]. TROJAN WS"
echo -e " [x]. EXIT"
echo -e "========================"
echo -e ""
read -p " Select From Options [1-3 or x] :  " prot
echo -e ""
case $prot in
1)
user_banned=$(cat /usr/local/etc/xray/config.json | grep -w "#banned_vmessws" | awk {'print $1, $5'} | tr -d '"' | tr -d '}' | awk {'print $2'})
if [[ -z $user_banned ]]; then
echo -e "No Vmess WS Account Got Banned !"
exit
fi
echo -e "=========================="
echo -e "LIST OF BANNED ACCOUNT"
echo -e "=========================="
echo -e "$user_banned"
echo -e "=========================="
echo ""
read -p "UNBANNED USER :  " unban
if [[ -z $unban ]]; then
echo -e "Please Input Valid User"
exit
fi
ngecek_user=$(cat /usr/local/etc/xray/config.json | grep -w "#banned_vmessws" | awk {'print $1, $5'} | tr -d '"' | tr -d '}' | awk {'print $2'} | grep -w "$unban")
if [[ -z $ngecek_user ]]; then
echo -e "Please Input Valid User"
exit
fi
sed -i '/"email": "'"$unban"'/s/#banned_vmessws },/},/' /usr/local/etc/xray/none.json
sed -i '/"email": "'"$unban"'/s/#banned_vmessws ,/,/' /usr/local/etc/xray/config.json
echo -e "UNBANNED $unban SUCCESS !"
echo -e "NOTIF UNBAN WILL AUTO SEND TO YOUR TELEGRAM"
ip_limit_vmessws=$(cat /etc/william/limit-xray/vmessws/$unban 2>/dev/null)
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="
<b>━━━━━━━━━━━━━━━━━</b>
<b>UNBAN VMESS WS</b>
<b>━━━━━━━━━━━━━━━━━</b>
<b>Username: </b><code>$unban</code>
<b>Limit IP: </b><code>$ip_limit_vmessws</code>
<b>Action: </b><code>UNBANNED</code>
<b>━━━━━━━━━━━━━━━━━</b>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
systemctl restart xray
systemctl restart xray@none
;;
2)
user_banned=$(cat /usr/local/etc/xray/config.json | grep -w "#banned_vlessws" | awk {'print $1, $5'} | tr -d '"' | tr -d '}' | awk {'print $2'})
if [[ -z $user_banned ]]; then
echo -e "No Vless WS Account Got Banned !"
exit
fi
echo -e "=========================="
echo -e "LIST OF BANNED ACCOUNT"
echo -e "=========================="
echo -e "$user_banned"
echo -e "=========================="
echo ""
read -p "UNBANNED USER :  " unban
if [[ -z $unban ]]; then
echo -e "Please Input Valid User"
exit
fi
ngecek_user=$(cat /usr/local/etc/xray/config.json | grep -w "#banned_vlessws" | awk {'print $1, $5'} | tr -d '"' | tr -d '}' | awk {'print $2'} | grep -w "$unban")
if [[ -z $ngecek_user ]]; then
echo -e "Please Input Valid User"
exit
fi
sed -i '/"email": "'"$unban"'/s/#banned_vlessws },/},/' /usr/local/etc/xray/none.json
sed -i '/"email": "'"$unban"'/s/#banned_vlessws ,/,/' /usr/local/etc/xray/config.json
echo -e "UNBANNED $unban SUCCESS !"
echo -e "NOTIF UNBAN WILL AUTO SEND TO YOUR TELEGRAM"
ip_limit_vlessws=$(cat /etc/william/limit-xray/vlessws/$unban 2>/dev/null)
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="
<b>━━━━━━━━━━━━━━━━━</b>
<b>UNBAN VLESS WS</b>
<b>━━━━━━━━━━━━━━━━━</b>
<b>Username: </b><code>$unban</code>
<b>Limit IP: </b><code>$ip_limit_vlessws</code>
<b>Action: </b><code>UNBANNED</code>
<b>━━━━━━━━━━━━━━━━━</b>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
systemctl restart xray
systemctl restart xray@none
;;
3)
user_banned=$(cat /usr/local/etc/xray/config.json | grep -w "#banned_trojanws" | awk {'print $1, $5'} | tr -d '"' | tr -d '}' | awk {'print $2'})
if [[ -z $user_banned ]]; then
echo -e "No Trojan WS Account Got Banned !"
exit
fi
echo -e "=========================="
echo -e "LIST OF BANNED ACCOUNT"
echo -e "=========================="
echo -e "$user_banned"
echo -e "=========================="
echo ""
read -p "UNBANNED USER :  " unban
if [[ -z $unban ]]; then
echo -e "Please Input Valid User"
exit
fi
ngecek_user=$(cat /usr/local/etc/xray/config.json | grep -w "#banned_trojanws" | awk {'print $1, $5'} | tr -d '"' | tr -d '}' | awk {'print $2'} | grep -w "$unban")
if [[ -z $ngecek_user ]]; then
echo -e "Please Input Valid User"
exit
fi
sed -i '/"email": "'"$unban"'/s/#banned_trojanws ,/,/' /usr/local/etc/xray/config.json
echo -e "UNBANNED $unban SUCCESS !"
echo -e "NOTIF UNBAN WILL AUTO SEND TO YOUR TELEGRAM"
ip_limit_trojanws=$(cat /etc/william/limit-xray/trojanws/$unban 2>/dev/null)
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="
<b>━━━━━━━━━━━━━━━━━</b>
<b>UNBAN TROJAN WS</b>
<b>━━━━━━━━━━━━━━━━━</b>
<b>Username: </b><code>$unban</code>
<b>Limit IP: </b><code>$ip_limit_trojanws</code>
<b>Action: </b><code>UNBANNED</code>
<b>━━━━━━━━━━━━━━━━━</b>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
systemctl restart xray
;;
x)
exit
menu
;;
*)
echo "Please enter an correct number"
;;
esac