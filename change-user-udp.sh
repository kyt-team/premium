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

# Path to the config file
config_file="/etc/william/udp/config.json"
current_user=$(cat /etc/william/udp/config.json | grep -o '"user": "[^"]*' | sed 's/"user": "//')
clear
echo "CHANGE SSH UDP USER MENU"
echo "━━━━━━━━━━━━━━━━━━━━━━"
echo "Current Username: $current_user"
echo "━━━━━━━━━━━━━━━━━━━━━━"
echo ""
# Prompt the user for a new username (only alphanumeric characters allowed)
read -p "Enter the new username : " new_username

# Check if the new username is empty
if [[ -z "$new_username" ]]; then
  echo "Username cannot be empty."
  exit 1
fi

# Validate the new username
if ! [[ "$new_username" =~ ^[[:alnum:]]+$ ]]; then
  echo "Invalid username. Only alphanumeric characters are allowed."
  exit 1
fi

# Replace the username in the config file using sed
sed -i "s/\"user\": \".*\"/\"user\": \"$new_username\"/" "$config_file"
echo ""
echo "Username has been changed to: $new_username"
systemctl restart udp-custom