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
pathws=$(cat /etc/xray/path/vmess_ws_path)
pathgrpc=$(cat /etc/xray/path/vmess_grpc_path)
pathtcp=$(cat /etc/xray/path/vmess_tcp_path)
tls="$(cat ~/log-install.txt | grep -w "TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "VMNONE" | cut -d: -f2|sed 's/ //g')"
nsdomain=$(cat /etc/ns/domain);
pubkey=$(cat /etc/william/slowdns/server.pub);
alternatifportntls=$(cat /etc/nginx/conf.d/vmnone.conf | grep listen | sed -n '2,$p' | awk '{printf $2 ","; if(NR==FNR) printf ""}' | sed 's/,$/./')
ngecek=$(cat /etc/systemd/system/slowdns.service | grep -o "443")
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w ${user}_ws /usr/local/etc/xray/config.json | wc -l)

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
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmessws$/a\### '"${user}_ws $exp VmessWS-TLS "'\
,{"id": "'""$uuid""'","level": '"0"',"email": "'""${user}_ws""'"}' /usr/local/etc/xray/config.json
sed -i '/#vmessWS$/a\### '"${user}_ws $exp VmessWS-NTLS "'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""${user}_ws""'"' /usr/local/etc/xray/none.json
cat>/etc/xray/vmess/$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}_ws",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "${pathws}",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF
cat>/etc/xray/vmess/$user-none.json<<EOF
      {
      "v": "2",
      "ps": "${user}_ws",
      "add": "${domain}",
      "port": "${none}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "${pathws}",
      "type": "none",
      "host": "",
      "tls": "none"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
sed -i '/#vmessGRPCX$/a\### '"${user}_grpc $exp VmessGRPC "'\
,{"id": "'""$uuid""'","add": "'""www.cloudflare.com""'","email": "'""${user}_grpc""'"}' /usr/local/etc/xray/config.json
cat>/etc/xray/vmess/$user-grpc.json<<EOF
      {
      "v": "2",
      "ps": "${user}_grpc",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "${pathgrpc}",
      "type": "gun",
      "host": "${domain}",
      "tls": "tls"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
sed -i '/#vmesstcp$/a\### '"${user}_tcp $exp Vmess-TCP "'\
,{"id": "'""$uuid""'","level": '"0"',"email": "'""${user}_tcp""'"}' /usr/local/etc/xray/config.json
cat>/etc/xray/vmess/$user-tcp.json<<EOF
      {
      "v": "2",
      "ps": "${user}_tcp",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "tcp",
      "path": "${pathtcp}",
      "type": "http",
      "host": "",
      "tls": "tls"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmesslink1ws="vmess://$(base64 -w 0 /etc/xray/vmess/$user-tls.json)"
vmesslink2ws="vmess://$(base64 -w 0 /etc/xray/vmess/$user-none.json)"
vmesslink1grpc="vmess://$(base64 -w 0 /etc/xray/vmess/$user-grpc.json)"
vmesslink1tcp="vmess://$(base64 -w 0 /etc/xray/vmess/$user-tcp.json)"
systemctl restart xray
systemctl restart xray@none
service cron restart
clear
echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "━━━━[XRAY/VMESS]━━━━"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Remarks WS : ${user}_ws"
echo -e "Remarks gRRPC : ${user}_grpc"
echo -e "Remarks TCP HTTP : ${user}_tcp"
echo -e "IP Address : ${MYIP}"
echo -e "Domain : ${domain}"
if [[ "$ngecek" = "443" ]]; then
echo -e "DNS Domain : $nsdomain"
echo -e "Pub key slowdns : $pubkey"
fi
echo -e "Port TLS : ${tls}"
echo -e "Port NONE-TLS : ${none}"
echo -e "Port Alternatif NONE-TLS : $alternatifportntls"
echo -e "ID : ${uuid}"
echo -e "Network : Websocket, gRPC, TCP"
echo -e "Websocket Path : ${pathws}"
echo -e "gRPC ServiceName : ${pathgrpc}"
echo -e "TCP HTTP Path : ${pathtcp}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "LINK WS TLS : ${vmesslink1ws}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "LINK WS NONE-TLS : ${vmesslink2ws}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "LINK gRPC TLS : ${vmesslink1grpc}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "LINK TCP HTTP TLS : ${vmesslink1tcp}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "EXPIRED ON : $exp"