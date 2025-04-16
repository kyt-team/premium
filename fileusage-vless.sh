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

while true; do
sleep 30
#get_data
data=($(grep -E -w "VlessWS-TLS " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq))
for user in "${data[@]}"; do
#create_folder
if [[ ! -e /etc/usage/vlesswstls-downlink ]]; then
mkdir -p /etc/usage/vlesswstls-downlink
fi
if [[ ! -e /etc/usage/vlesswstls-uplink ]]; then
mkdir -p /etc/usage/vlesswstls-uplink
fi
#get_downlink
result=$(xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>downlink")
if echo "$result" | grep -q "value"; then
downlink=$(echo "$result" | grep -w "value" | awk '{print $2}' | tr -d '"')
if [ -e /etc/usage/vlesswstls-downlink/${user} ]; then
plus2=$(cat /etc/usage/vlesswstls-downlink/${user})
plus3=$((downlink + plus2))
echo "$plus3" > /etc/usage/vlesswstls-downlink/"${user}"
else
echo "$downlink" > /etc/usage/vlesswstls-downlink/"${user}"
fi
xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>downlink" -reset > /dev/null 2>&1
fi
#get_uplink
result2=$(xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>uplink")
if echo "$result2" | grep -q "value"; then
uplink=$(echo "$result2" | grep -w "value" | awk '{print $2}' | tr -d '"')
if [ -e /etc/usage/vlesswstls-uplink/${user} ]; then
plus4=$(cat /etc/usage/vlesswstls-uplink/${user})
plus5=$((uplink + plus4))
echo "$plus5" > /etc/usage/vlesswstls-uplink/"${user}"
else
echo "$uplink" > /etc/usage/vlesswstls-uplink/"${user}"
fi
xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>uplink" -reset > /dev/null 2>&1
fi
done
#get_data
data=($(grep -E -w "VlessWS-NTLS " "/usr/local/etc/xray/none.json" | cut -d ' ' -f 2 | sort | uniq))
for user in "${data[@]}"; do
#create_folder
if [[ ! -e /etc/usage/vlesswsntls-downlink ]]; then
mkdir -p /etc/usage/vlesswsntls-downlink
fi
if [[ ! -e /etc/usage/vlesswsntls-uplink ]]; then
mkdir -p /etc/usage/vlesswsntls-uplink
fi
#get_downlink
result=$(xray api stats --server=127.0.0.1:10086 -name "user>>>${user}>>>traffic>>>downlink")
if echo "$result" | grep -q "value"; then
downlink=$(echo "$result" | grep -w "value" | awk '{print $2}' | tr -d '"')
if [ -e /etc/usage/vlesswsntls-downlink/${user} ]; then
plus2=$(cat /etc/usage/vlesswsntls-downlink/${user})
plus3=$((downlink + plus2))
echo "$plus3" > /etc/usage/vlesswsntls-downlink/"${user}"
else
echo "$downlink" > /etc/usage/vlesswsntls-downlink/"${user}"
fi
xray api stats --server=127.0.0.1:10086 -name "user>>>${user}>>>traffic>>>downlink" -reset > /dev/null 2>&1
fi
#get_uplink
result2=$(xray api stats --server=127.0.0.1:10086 -name "user>>>${user}>>>traffic>>>uplink")
if echo "$result2" | grep -q "value"; then
uplink=$(echo "$result2" | grep -w "value" | awk '{print $2}' | tr -d '"')
if [ -e /etc/usage/vlesswsntls-uplink/${user} ]; then
plus4=$(cat /etc/usage/vlesswsntls-uplink/${user})
plus5=$((uplink + plus4))
echo "$plus5" > /etc/usage/vlesswsntls-uplink/"${user}"
else
echo "$uplink" > /etc/usage/vlesswsntls-uplink/"${user}"
fi
xray api stats --server=127.0.0.1:10086 -name "user>>>${user}>>>traffic>>>uplink" -reset > /dev/null 2>&1
fi
done
#get_data
data=($(grep -E -w "VlessGRPC " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq))
for user in "${data[@]}"; do
#create_folder
if [[ ! -e /etc/usage/vlessgrpctls-downlink ]]; then
mkdir -p /etc/usage/vlessgrpctls-downlink
fi
if [[ ! -e /etc/usage/vlessgrpctls-uplink ]]; then
mkdir -p /etc/usage/vlessgrpctls-uplink
fi
#get_downlink
result=$(xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>downlink")
if echo "$result" | grep -q "value"; then
downlink=$(echo "$result" | grep -w "value" | awk '{print $2}' | tr -d '"')
if [ -e /etc/usage/vlessgrpctls-downlink/${user} ]; then
plus2=$(cat /etc/usage/vlessgrpctls-downlink/${user})
plus3=$((downlink + plus2))
echo "$plus3" > /etc/usage/vlessgrpctls-downlink/"${user}"
else
echo "$downlink" > /etc/usage/vlessgrpctls-downlink/"${user}"
fi
xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>downlink" -reset > /dev/null 2>&1
fi
#get_uplink
result2=$(xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>uplink")
if echo "$result2" | grep -q "value"; then
uplink=$(echo "$result2" | grep -w "value" | awk '{print $2}' | tr -d '"')
if [ -e /etc/usage/vlessgrpctls-uplink/${user} ]; then
plus4=$(cat /etc/usage/vlessgrpctls-uplink/${user})
plus5=$((uplink + plus4))
echo "$plus5" > /etc/usage/vlessgrpctls-uplink/"${user}"
else
echo "$uplink" > /etc/usage/vlessgrpctls-uplink/"${user}"
fi
xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>uplink" -reset > /dev/null 2>&1
fi
done
#get_data
data=($(grep -E -w "VlessXTLS " "/usr/local/etc/xray/will666.json" | cut -d ' ' -f 2 | sort | uniq))
for user in "${data[@]}"; do
#create_folder
if [[ ! -e /etc/usage/vlessxtls-downlink ]]; then
mkdir -p /etc/usage/vlessxtls-downlink
fi
if [[ ! -e /etc/usage/vlessxtls-uplink ]]; then
mkdir -p /etc/usage/vlessxtls-uplink
fi
#get_downlink
result=$(xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>downlink")
if echo "$result" | grep -q "value"; then
downlink=$(echo "$result" | grep -w "value" | awk '{print $2}' | tr -d '"')
if [ -e /etc/usage/vlessxtls-downlink/${user} ]; then
plus2=$(cat /etc/usage/vlessxtls-downlink/${user})
plus3=$((downlink + plus2))
echo "$plus3" > /etc/usage/vlessxtls-downlink/"${user}"
else
echo "$downlink" > /etc/usage/vlessxtls-downlink/"${user}"
fi
xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>downlink" -reset > /dev/null 2>&1
fi
#get_uplink
result2=$(xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>uplink")
if echo "$result2" | grep -q "value"; then
uplink=$(echo "$result2" | grep -w "value" | awk '{print $2}' | tr -d '"')
if [ -e /etc/usage/vlessxtls-uplink/${user} ]; then
plus4=$(cat /etc/usage/vlessxtls-uplink/${user})
plus5=$((uplink + plus4))
echo "$plus5" > /etc/usage/vlessxtls-uplink/"${user}"
else
echo "$uplink" > /etc/usage/vlessxtls-uplink/"${user}"
fi
xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>uplink" -reset > /dev/null 2>&1
fi
done
done