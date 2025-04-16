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
LinkClash=$(curl -sS -H 'Cache-Control: no-cache, no-store' https://raw.githubusercontent.com/willstore69/config/main/clash.yaml > /tmp/clash.yaml)
LinkJson=$(curl -sS -H 'Cache-Control: no-cache, no-store' https://raw.githubusercontent.com/willstore69/config/main/config.json > /tmp/config.json)
domain=$(cat /etc/xray/domain)
tls="$(cat ~/log-install.txt | grep -w "TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/will69.json | wc -l)
		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
cekvalidasi=$(cat /usr/local/etc/xray/will69.json | grep -i "$user" | awk {'print $2'} | head -1 | wc -l)
if [ "$cekvalidasi" == "1" ]; then
echo ""
echo "user $user already exist"
echo "please choose another name"
exit 1
fi
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojantcp$/a\### '"$user $exp Trojan "'\
,{"password": "'""$uuid""'","level": '"0"',"email": "'""$user""'"}' /usr/local/etc/xray/will69.json
trojanlink="trojan://$uuid@$domain:$tls?security=tls&alpn=http/1.1&headerType=none&type=tcp&sni=isi_bug_disini#$user"
systemctl restart will69
random=$(echo $RANDOM | md5sum | head -c 4; echo;)
mkdir -p /home/vps/public_html/config/
# untuk clash
sed -i "s/nama_kamu/$user/g" /tmp/clash.yaml
sed -i "s/domain_kamu/$domain/g" /tmp/clash.yaml
sed -i "s/port_kamu/$tls/g" /tmp/clash.yaml
sed -i "s/password_kamu/$uuid/g" /tmp/clash.yaml
mv /tmp/clash.yaml /home/vps/public_html/config/$random-$user-clash.yaml
# untuk json
sed -i "s/domain_kamu/$domain/g" /tmp/config.json
sed -i "s/password_kamu/$uuid/g" /tmp/config.json
sed -i "s/port_kamu/$tls/g" /tmp/config.json
mv /tmp/config.json /home/vps/public_html/config/$random-$user-config.json
clear
echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "━━━━[XRAY/TROJAN]━━━━"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "Remarks : ${user}"
echo -e "IP Address : ${MYIP}"
echo -e "Domain : ${domain}"
echo -e "Port TLS : ${tls}"
echo -e "Password : ${uuid}"
echo -e "Network : TCP"
echo -e "Alpn : http/1.1"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "LINK TLS : ${trojanlink}"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "LINK CLASH : http://$domain:8081/config/$random-$user-clash.yaml"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "LINK JSON : http://$domain:8081/config/$random-$user-config.json"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "EXPIRED ON : $exp"
rm -rf /tmp/config.json
rm -rf /tmp/clash.yaml