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


echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${red}                        [ MENU SETTING ]                         ${NC}"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green [•1] $NC CHANGE DOMAIN OR FORCE DOMAIN [${green}force-host${NC}]"
echo -e "$green [•2] $NC CHANGE SLOWDNS MODE [${green}change-slowdns${NC}]"
echo -e "$green [•3] $NC CHANGE PORT [${green}change-port${NC}]"
echo -e "$green [•4] $NC CHANGE UUID OR PASSWORD ACCOUNT VPN [XRAY] [${green}change-uuid${NC}]"
echo -e "$green [•5] $NC CHANGE ALTERNATIF PORT [${green}change-alt-port${NC}]"
echo -e "$green [•6] $NC AUTOBACKUP VIA GMAIL [${green}autobackup${NC}]"
echo -e "$green [•7] $NC AUTOBACKUP VIA BOT TELEGRAM [${green}backup-bot${NC}]"
echo -e "$green [•8] $NC AUTOSEND TRIAL VPN VIA BOT TELEGRAM [${green}auto-sendvpn${NC}]"
echo -e "$green [•9] $NC BACKUP VIA GMAIL [${green}backup${NC}]"
echo -e "$green [•10] $NC BACKUP VIA BOT TELEGRAM [${green}bckp-bot${NC}]"
echo -e "$green [•11] $NC MONITORING CPU USAGE [${green}htop${NC}]"
echo -e "$green [•12] $NC LIMIT BANDWITH SPEED SERVER [${green}limit-speed${NC}]"
echo -e "$green [•13] $NC CHECK USAGE OF RAM [${green}ram${NC}]"
echo -e "$green [•14] $NC RESTART ALL SERVICES [${green}restart${NC}]"
echo -e "$green [•15] $NC RESTORE DATA VPS [${green}restore${NC}]"
echo -e "$green [•16] $NC UPDATE KERNEL TO LATEST VERSION [${green}update-kernel${NC}]"
echo -e "$green [•17] $NC CHANGE KERNEL TYPE 'CLOUD' TO ANOTHER VERSION [${green}fix-kernel-cloud${NC}]"
echo -e "$green [•18] $NC INSTALL WEBMIN [${green}wbmn${NC}]"
echo -e "$green [•19] $NC SPEEDTEST SERVER [${green}speedtest${NC}]"
echo -e "$green [•20] $NC RETURN TO BEGINNING MENU [${green}menu2${NC}]"
echo -e "$green [•21] $NC WARP CLOUDFLARE [${green}warp${NC}]"
echo -e "$green [•22] $NC VIEW SERVER'S TOTAL BANDWIDTH [${green}vnstat${NC}]"
echo -e "$green [•23] $NC VIEW PROTOCOL & PORT INFORMATION [${green}info${NC}]"
echo -e "$green [•24] $NC REBOOT SERVER [${green}reboot${NC}]"
echo -e "$green [•25] $NC MENU BUNDLING [${green}menu-bundling${NC}]"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${red}  CLIENT NAME :${NC} $clientname        |      ${red}EXP DATE :${NC} $exp  "
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e   ""
echo -e "[CTRL + C] For Exit From Main Menu"
echo -e   ""
read -p "Select From Options [1-37 or x] :  " menu
echo -e ""
case $menu in
1)
force-host
;;
2)
change-slowdns
;;
3)
change-port
;;
4)
change-uuid
;;
5)
change-alt-port
;;
6)
autobackup
;;
7)
backup-bot
;;
8)
auto-sendvpn
;;
9)
backup
;;
10)
bckp-bot
;;
11)
htop
;;
12)
limit-speed
;;
13)
ram
;;
14)
restart
;;
15)
restore
;;
16)
update-kernel
;;
17)
fix-kernel-cloud
;;
18)
wbmn
;;
19)
speedtest
;;
20)
menu2
;;
21)
warp
;;
22)
vnstat
;;
23)
info
;;
24)
reboot
;;
25)
menu-bundling
x)
clear
menu2
;;
*)
echo " Please Choose Number !"
sleep 2 
menu
;;
esac
