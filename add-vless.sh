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

domain=$(cat /etc/xray/domain)
pathku=$(cat /etc/xray/path/vless_ws_path)
tls="$(cat ~/log-install.txt | grep -w "TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "VLNONE" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
cekvalidasi=$(cat /usr/local/etc/xray/config.json | grep -i "$user" | awk {'print $2'} | head -1 | wc -l)
if [ "$cekvalidasi" == "1" ]; then
echo ""
echo "user $user already exist"
echo "please choose another name"
exit 1
fi
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
KEY=$(cat /etc/william/profile/key 2>/dev/null)
CHATID=$(cat /etc/william/profile/key 2>/dev/null)
if [[ -n $KEY || -n $CHATID ]]; then
read -p "Limit IP Login (enter or type 0 for no limit): " limit_ip
if [[ -z "$limit_ip" || "$limit_ip" == "0" ]]; then
  limit_ip="0"
fi
echo "$limit_ip" > "/etc/william/limit-xray/vlessws/$user"
fi
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vlessws$/a\### '"$user $exp VlessWS-TLS "'\
,{"id": "'""$uuid""'","level": '"0"',"email": "'""$user""'"}' /usr/local/etc/xray/config.json
sed -i '/#vlessWS$/a\### '"$user $exp VlessWS-NTLS "'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/none.json
vlesslink1="vless://${uuid}@${domain}:$tls?path=$pathku&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:$none?path=$pathku&encryption=none&type=ws#${user}"
systemctl restart xray
systemctl restart xray@none
clear
echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "━━━[XRAY/VLESS_WS]━━━"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "Remarks : ${user}"
ceklimit_ip=$(cat /etc/william/limit-xray/vlessws/$user 2>/dev/null)
if [[ -z $ceklimit_ip ]]; then
echo -e "Limit IP : Not Active"
else
if [ "$ceklimit_ip" == "0" ]; then
echo -e "Limit IP : No Limit IP Login"
else
echo -e "Limit IP : $limit_ip"
fi
fi
echo -e "Domain : ${domain}"
echo -e "IP Address : ${MYIP}"
echo -e "Port TLS : ${tls}"
echo -e "Port NONE-TLS : ${none}"
echo -e "ID : ${uuid}"
echo -e "Network : Websocket"
echo -e "Websocket Path : ${pathku}"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "LINK WS TLS : ${vlesslink1}"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "LINK WS NONE-TLS : ${vlesslink2}"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "EXPIRED ON : $exp"