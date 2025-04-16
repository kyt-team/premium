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

pathku=$(cat /etc/xray/path/trojan_ws_path)
domain=$(cat /etc/xray/domain)
tls="$(cat ~/log-install.txt | grep -w "TLS" | cut -d: -f2|sed 's/ //g')"
protocol=$(grep -E -w "TrojanWS" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4-4 | head -1)
if [[ $protocol = "TrojanWS" ]];
then
echo "found"
else
echo "You have no existing clients!"
exit 1
fi
NUMBER_OF_CLIENTS=$(grep -c -E "$protocol " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	echo " check detail information client exist"
	echo " Press CTRL+C to return"
	echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	echo "     No User  Expired  Protocol"
	grep -E -w "$protocol " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-4 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
user=$(grep -E -w "$protocol" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E -w "$protocol" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(cat /usr/local/etc/xray/config.json | grep -w "$user" | awk {'print $2'} | tail -n 1 | tr -d '"' | sed 's/level://g' | tr -d ',')
trojanlink="trojan://${uuid}@${domain}:${tls}?path=${pathku}&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
clear
echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "━━━━[XRAY/TROJAN_WS]━━━━"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Remarks : ${user}"
ceklimit_ip=$(cat /etc/william/limit-xray/trojanws/$user 2>/dev/null)
if [[ -z $ceklimit_ip || $ceklimit_ip == 0 ]]; then
echo -e "Limit IP : No Limit"
else
echo -e "Limit IP : $ceklimit_ip"
fi
echo -e "IP Address : ${MYIP}"
echo -e "Domain : ${domain}"
echo -e "Port TLS : ${tls}"
echo -e "Password : ${uuid}"
echo -e "Network : Websocket"   
echo -e "Websocket Path : ${pathku}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "LINK WS TLS : ${trojanlink}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "EXPIRED ON : $exp"