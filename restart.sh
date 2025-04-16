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

echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e ""
echo -e "    [1] Restart All Services"
echo -e "    [2] Restart OpenSSH"
echo -e "    [3] Restart Dropbear"
echo -e "    [4] Restart Stunnel5"
echo -e "    [5] Restart OpenVPN"
echo -e "    [6] Restart Squid"
echo -e "    [7] Restart Nginx"
echo -e "    [8] Restart Badvpn"
echo -e "    [9] Restart Xray TLS"
echo -e "    [10] Restart Xray NTLS"
echo -e "    [x] Exit"
echo -e ""
read -p "    Select From Options [1-10 or x] :  " Restart
echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
sleep 1
clear
case $Restart in
                1)
                clear
                /etc/init.d/ssh restart
                /etc/init.d/dropbear restart
                /etc/init.d/stunnel5 restart
                /etc/init.d/openvpn restart
                /etc/init.d/fail2ban restart
                /etc/init.d/cron restart
                /etc/init.d/nginx restart
                /etc/init.d/squid restart
                systemctl restart xray
                systemctl restart will666
                systemctl restart will69
                systemctl restart xray@none
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 512 --max-connections-for-client 10
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 512 --max-connections-for-client 10
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 512 --max-connections-for-client 10
                echo -e ""
                echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
                echo -e ""
                echo -e "          Service/s Restarted         "
                echo -e ""
                echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
                exit
                ;;
                2)
                clear
                /etc/init.d/ssh restart
                echo -e ""
                echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
                echo -e ""
                echo -e "         SSH Service Restarted        "
                echo -e ""
                echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
                exit
                ;;
                3)
                clear
                /etc/init.d/dropbear stop
                /etc/init.d/dropbear stop
                pkill -f dropbear
                /etc/init.d/dropbear start
                echo -e ""
                echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
                echo -e ""
                echo -e "       Dropbear Service Restarted     "
                echo -e ""
                echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
                exit
                ;;
                4)
                clear
                /etc/init.d/stunnel5 restart
                echo -e ""
                echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
                echo -e ""
                echo -e "        Stunnel4 Service Restarted    "
                echo -e ""
                echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
                exit
                ;;
                5)
                clear
                /etc/init.d/openvpn restart
                echo -e ""
                echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
                echo -e ""
                echo -e "       OpenVPN Service Restarted      "
                echo -e ""
                echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
                exit
                ;;
                6)
                clear
                /etc/init.d/squid restart
                echo -e ""
                echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
                echo -e ""
                echo -e "        Squid3 Service Restarted      "
                echo -e ""
                echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
                exit
                ;;
                7)
                clear
                /etc/init.d/nginx restart
                echo -e ""
                echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
                echo -e ""
                echo -e "         Nginx Service Restarted      "
                echo -e ""
                echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
                exit
                ;;
                8)
                clear
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 512 --max-connections-for-client 10
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 512 --max-connections-for-client 10
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 512 --max-connections-for-client 10
                echo -e ""
                echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
                echo -e ""
                echo -e "    Badvpn  Badvpn Service Restarted  "
                echo -e ""
                echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
                exit
                ;;
                9)
                clear
                systemctl restart xray
                systemctl restart will69
                systemctl restart will666
                echo -e ""
                echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
                echo -e ""
                echo -e "    Xray TLS Service Restarted  "
                echo -e ""
                echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
                exit
                ;;
                10)
                clear
                systemctl restart xray@none
                echo -e ""
                echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
                echo -e ""
                echo -e "    Xray NTLS Service Restarted  "
                echo -e ""
                echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
                exit
                ;;
                x)
                clear
                exit
                ;;
        esac
