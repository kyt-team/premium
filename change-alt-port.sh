#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
if [[ $(ulimit -c) != "0" ]]; then
  echo "Im Watching You..."
  echo "- @user_legend"
  exit 1
fi

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

# VMESS WS NTLS
file_path="/etc/nginx/conf.d/vmnone.conf"

display_ports() {
  echo -e ""
  echo -e "List of alternative ports"
  echo -e "━━━━━━━━━━━━━━━━━"
  grep -oP "listen \K\d+" "$file_path" | tail -n +2
  echo -e "━━━━━━━━━━━━━━━━━"
  echo -e ""
}

display_ports
read -p "Enter the port you want to change: " selected_port
if [ -z "$selected_port" ]; then
  echo -e "Please input a port from the list."
  exit 0
fi

if ! grep -wq "listen $selected_port" "$file_path"; then
  echo -e "Port $selected_port is not valid."
  echo -e "Please input a port from the list."
  exit 0
fi

read -p "Enter the new port: " new_port
if [ -z "$new_port" ]; then
  echo -e "Please input a new port."
  exit 0
fi

cekport=$(netstat -ntlulp | grep -o "$new_port" | sort -u)
serviceused=$(netstat -ntlulp | grep -w $new_port | cut -d/ -f2 | sort -u)
if [ -z "$cekport" ]; then
continue
else
echo -e ""
echo -e "port $selected_port is already in use."
echo -e "port used on service : ${green}$serviceused${NC}"
exit 0
fi

if grep -q "listen $new_port" "$file_path"; then
  echo -e "Port ${green}$new_port${NC} is already in use."
  exit 0
fi

sed -i "s/listen $selected_port backlog=65535 reuseport;/listen $new_port backlog=65535 reuseport;/" "$file_path"
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport "$selected_port" -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport "$selected_port" -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport "$new_port" -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport "$new_port" -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl daemon-reload > /dev/null
systemctl restart nginx > /dev/null
echo -e ""
echo -e "Port $selected_port has been changed to $new_port"
display_ports