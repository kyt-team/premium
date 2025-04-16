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

ngecek=$(cat /etc/systemd/system/slowdns.service | grep -o "22")
if [[ "$ngecek" = "22" ]]; then
status1='ENABLED ✓'
else
status2='ENABLED ✓'
fi

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "\E[41;1;37m                 CHOSEE SLOWDNS MODE                     \E[0m"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "   [1]  Direct Slowdns ( SSH OVER DNS )  ${green}$status1${NC}"
echo -e "   [2]  Slowdns + Vmess & Slowdns + SSH TLS/SNI ( XRAY OVER DNS )  ${green}$status2${NC}"
echo -e "   [x]  Back To Menu"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e ""
read -p "     Select From Options [1-2 or x] :  " prot
echo -e ""
case $prot in
1)
ngecek=$(cat /etc/systemd/system/slowdns.service | grep -o "22")
if [[ "$ngecek" = "22" ]]; then
echo "You Already Using This Right Now !"
else
echo "Okay Proses Change. Please Wait..."
sleep 3
sed -i "s/443/22/g" /etc/systemd/system/slowdns.service
systemctl daemon-reload
systemctl restart slowdns
echo -e "Succesfully Change Mode To ${green}DNS OVER SSH${NC}"
fi
;;
2)
ngecek=$(cat /etc/systemd/system/slowdns.service | grep -o "443")
if [[ "$ngecek" = "443" ]]; then
echo "You Already Using This Right Now !"
else
echo "Okay Proses Change. Please Wait..."
sleep 3
sed -i "s/22/443/g" /etc/systemd/system/slowdns.service
systemctl daemon-reload
systemctl restart slowdns
echo -e "Succesfully Change Mode To ${green}XRAY OVER DNS${NC}"
fi
;;
x)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
 
