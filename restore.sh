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
echo "This Feature Can Only Be Used According To Vps Data With This Autoscript"
echo "Please input link to your vps data backup file."
echo "You can check it on your email if you run backup data vps before."
read -rp "Link File: " -e url
wget --no-check-certificate -O backup.zip "$url"
unzip backup.zip
rm -f backup.zip
sleep 1
echo "Start Restore"
cd /root/backup
cp -r xray /etc/
cp -r v2ray /etc/
cp -r premium-script /var/lib/
cp -r public_html /home/vps/
cp -r private /etc/ssl/
cp -r william /etc/
cp -r slowdns /etc/william/
cp -r conf.d /etc/nginx/
cp passwd /etc/
cp group /etc/
cp gshadow /etc/
cp shadow /etc/
cp config.json /usr/local/etc/xray/
cp none.json /usr/local/etc/xray/
cp will69.json /usr/local/etc/xray/
cp will666.json /usr/local/etc/xray/
cp cdn.service /etc/systemd/system/
cp chap-secrets /etc/ppp/
cp passwd1 /etc/ipsec.d/passwd
cp log-install.txt /root/
cd /root
rm -rf /root/backup
rm -rf backup.zip
/etc/william/slowdns/./dns-server -gen-key -privkey-file /etc/william/slowdns/server.key -pubkey-file /etc/william/slowdns/server.pub
systemctl restart stunnel5
systemctl restart cdn
systemctl restart xray
systemctl restart xray@none
systemctl restart will69
systemctl restart will666
systemctl restart slowdns
systemctl restart udp-custom
sleep 1
cp /etc/openvpn/client-udp-2200.ovpn /home/vps/public_html/client-udp-2200.ovpn
cp /etc/openvpn/client-tcp-1194.ovpn /home/vps/public_html/client-tcp-1194.ovpn
cp /etc/openvpn/client-tcp-ssl-442.ovpn /home/vps/public_html/client-tcp-ssl-442.ovpn
cp /etc/ipsec.d/cacerts/vpn_ca_cert.pem /home/vps/public_html/${DOMAIN}_IKEV2-EAP-CA.pem
echo "Done"
echo "Reboot on 3sec"
sleep 3
reboot