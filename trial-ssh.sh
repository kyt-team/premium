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

DOMAIN=$(cat /etc/xray/domain);
nsdomain=$(cat /etc/ns/domain);
pubkey=$(cat /etc/william/slowdns/server.pub);
alternatifportntls=$(cat /etc/nginx/conf.d/vmnone.conf | grep listen | sed -n '1,$p' | awk '{printf $2 ", "; if(NR==FNR) printf ""}' | sed 's/ 69, 55//g' | sed '$s/, $/./' | sed 's/\(.*\),/\1/')
ngecek=$(cat /etc/systemd/system/slowdns.service | grep -o "22")
clear
IP=$(wget -qO- ipinfo.io/ip);
tls="$(cat ~/log-install.txt | grep -w "XRAY TLS" | cut -d: -f2|sed 's/ //g')"
ssl2="$(cat ~/log-install.txt | grep -w "Stunnel5" | cut -d " " -f 22|sed 's/,//g')"
ws="$(cat ~/log-install.txt | grep -w "SSHWS" | cut -d: -f2|sed 's/ //g')"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpnssl="$(cat ~/log-install.txt | grep -w "OpenVPN SSL" | cut -d: -f2|sed 's/ //g')"
ovpnws="$(cat ~/log-install.txt | grep -w "OpenVPN WS" | cut -d: -f2|sed 's/ //g')"
current_user=$(cat /etc/william/udp/config.json | grep -o '"user": "[^"]*' | sed 's/"user": "//')
Login=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=1
echo Ping Host
echo Cek Hak Akses...
sleep 0.5
echo Permission Accepted
clear
sleep 0.5
echo Membuat Akun: $Login
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e "${Login} > ${Pass}" >> /etc/william/udp/udp.conf
echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "INFORMASI TRIAL"
echo -e "SSH & OVPN ACCOUNT"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "IP-Addres : $MYIP"
echo -e "Hostname : $DOMAIN"
echo -e "Username : $Login"
echo -e "Password : $Pass"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "Port openssh : 22, $tls"
echo -e "Port dropbear : 109, 143, $tls"
echo -e "Port ssh udp : 1-65535"
echo -e "Port stunnel : $tls, "
echo -e "Port ssh websocket http : $ws"
echo -e "Alternatif port ovpn & ssh websocket http : $alternatifportntls"
echo -e "Port ssh websocket https : $ssl2"
echo -e "Port ovpn websocket http : $ovpnws"
echo -e "Port squid : 2086, 3128"
echo -e "Port badvpn/udpgw : 7100-7300"
if [[ "$ngecek" = "22" ]]; then
echo -e "DNS Hostname : $nsdomain"
echo -e "Pub key slowdns : $pubkey"
echo -e "Dns for slowdns : 1.1.1.1 / 8.8.8.8"
fi
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "OPENVPN TCP : $ovpn http://$DOMAIN:8081/client-tcp-$ovpn.ovpn"
echo -e "OPENVPN TCP : $tls http://$DOMAIN:8081/client-tcp-$tls.ovpn"
echo -e "OPENVPN UDP : $ovpn2 http://$DOMAIN:8081/client-udp-$ovpn2.ovpn"
echo -e "OPENVPN SSL : $ovpnssl http://$DOMAIN:8081/client-tcp-ssl-$ovpnssl.ovpn"
echo -e "ALL OPENVPN CONFIG : http://$DOMAIN:8081/openvpn.zip"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "Payload SSH WS : GET / HTTP/1.1[crlf]Host: $DOMAIN[crlf]Upgrade: Websocket[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf][crlf]"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "Payload OVPN WS : GET /ovpn HTTP/1.1[crlf]Host: $DOMAIN[crlf]Upgrade: Websocket[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf][crlf]"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "Payload WS ENHANCED : PATCH / HTTP/1.1[crlf]Host: [host][crlf]Host: ISI_BUG_DISINI[crlf]Connection: Upgrade[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "Expired on : $exp"
systemctl restart udp-custom