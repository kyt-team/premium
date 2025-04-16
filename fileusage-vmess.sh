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
data=($(grep -E -w "VmessWS-TLS " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq))
for user in "${data[@]}"; do
#create_folder
if [[ ! -e /etc/usage/vmesswstls-downlink ]]; then
mkdir -p /etc/usage/vmesswstls-downlink
fi
if [[ ! -e /etc/usage/vmesswstls-uplink ]]; then
mkdir -p /etc/usage/vmesswstls-uplink
fi
#get_downlink
result=$(xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>downlink")
if echo "$result" | grep -q "value"; then
downlink=$(echo "$result" | grep -w "value" | awk '{print $2}' | tr -d '"')
if [ -e /etc/usage/vmesswstls-downlink/${user} ]; then
plus2=$(cat /etc/usage/vmesswstls-downlink/${user})
plus3=$((downlink + plus2))
echo "$plus3" > /etc/usage/vmesswstls-downlink/"${user}"
else
echo "$downlink" > /etc/usage/vmesswstls-downlink/"${user}"
fi
xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>downlink" -reset > /dev/null 2>&1
fi
#get_uplink
result2=$(xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>uplink")
if echo "$result2" | grep -q "value"; then
uplink=$(echo "$result2" | grep -w "value" | awk '{print $2}' | tr -d '"')
if [ -e /etc/usage/vmesswstls-uplink/${user} ]; then
plus4=$(cat /etc/usage/vmesswstls-uplink/${user})
plus5=$((uplink + plus4))
echo "$plus5" > /etc/usage/vmesswstls-uplink/"${user}"
else
echo "$uplink" > /etc/usage/vmesswstls-uplink/"${user}"
fi
xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>uplink" -reset > /dev/null 2>&1
fi
done
#get_data
data=($(grep -E -w "VmessWS-NTLS " "/usr/local/etc/xray/none.json" | cut -d ' ' -f 2 | sort | uniq))
for user in "${data[@]}"; do
#create_folder
if [[ ! -e /etc/usage/vmesswsntls-downlink ]]; then
mkdir -p /etc/usage/vmesswsntls-downlink
fi
if [[ ! -e /etc/usage/vmesswsntls-uplink ]]; then
mkdir -p /etc/usage/vmesswsntls-uplink
fi
#get_downlink
result=$(xray api stats --server=127.0.0.1:10086 -name "user>>>${user}>>>traffic>>>downlink")
if echo "$result" | grep -q "value"; then
downlink=$(echo "$result" | grep -w "value" | awk '{print $2}' | tr -d '"')
if [ -e /etc/usage/vmesswsntls-downlink/${user} ]; then
plus2=$(cat /etc/usage/vmesswsntls-downlink/${user})
plus3=$((downlink + plus2))
echo "$plus3" > /etc/usage/vmesswsntls-downlink/"${user}"
else
echo "$downlink" > /etc/usage/vmesswsntls-downlink/"${user}"
fi
xray api stats --server=127.0.0.1:10086 -name "user>>>${user}>>>traffic>>>downlink" -reset > /dev/null 2>&1
fi
#get_uplink
result2=$(xray api stats --server=127.0.0.1:10086 -name "user>>>${user}>>>traffic>>>uplink")
if echo "$result2" | grep -q "value"; then
uplink=$(echo "$result2" | grep -w "value" | awk '{print $2}' | tr -d '"')
if [ -e /etc/usage/vmesswsntls-uplink/${user} ]; then
plus4=$(cat /etc/usage/vmesswsntls-uplink/${user})
plus5=$((uplink + plus4))
echo "$plus5" > /etc/usage/vmesswsntls-uplink/"${user}"
else
echo "$uplink" > /etc/usage/vmesswsntls-uplink/"${user}"
fi
xray api stats --server=127.0.0.1:10086 -name "user>>>${user}>>>traffic>>>uplink" -reset > /dev/null 2>&1
fi
done
#get_data
data=($(grep -E -w "Vmess-TCP " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq))
for user in "${data[@]}"; do
#create_folder
if [[ ! -e /etc/usage/vmesstcphttp-downlink ]]; then
mkdir -p /etc/usage/vmesstcphttp-downlink
fi
if [[ ! -e /etc/usage/vmesstcphttp-uplink ]]; then
mkdir -p /etc/usage/vmesstcphttp-uplink
fi
#get_downlink
result=$(xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>downlink")
if echo "$result" | grep -q "value"; then
downlink=$(echo "$result" | grep -w "value" | awk '{print $2}' | tr -d '"')
if [ -e /etc/usage/vmesstcphttp-downlink/${user} ]; then
plus2=$(cat /etc/usage/vmesstcphttp-downlink/${user})
plus3=$((downlink + plus2))
echo "$plus3" > /etc/usage/vmesstcphttp-downlink/"${user}"
else
echo "$downlink" > /etc/usage/vmesstcphttp-downlink/"${user}"
fi
xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>downlink" -reset > /dev/null 2>&1
fi
#get_uplink
result2=$(xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>uplink")
if echo "$result2" | grep -q "value"; then
uplink=$(echo "$result2" | grep -w "value" | awk '{print $2}' | tr -d '"')
if [ -e /etc/usage/vmesstcphttp-uplink/${user} ]; then
plus4=$(cat /etc/usage/vmesstcphttp-uplink/${user})
plus5=$((uplink + plus4))
echo "$plus5" > /etc/usage/vmesstcphttp-uplink/"${user}"
else
echo "$uplink" > /etc/usage/vmesstcphttp-uplink/"${user}"
fi
xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>uplink" -reset > /dev/null 2>&1
fi
done
#get_data
data=($(grep -E -w "VmessGRPC " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq))
for user in "${data[@]}"; do
#create_folder
if [[ ! -e /etc/usage/vmessgrpctls-downlink ]]; then
mkdir -p /etc/usage/vmessgrpctls-downlink
fi
if [[ ! -e /etc/usage/vmessgrpctls-uplink ]]; then
mkdir -p /etc/usage/vmessgrpctls-uplink
fi
#get_downlink
result=$(xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>downlink")
if echo "$result" | grep -q "value"; then
downlink=$(echo "$result" | grep -w "value" | awk '{print $2}' | tr -d '"')
if [ -e /etc/usage/vmessgrpctls-downlink/${user} ]; then
plus2=$(cat /etc/usage/vmessgrpctls-downlink/${user})
plus3=$((downlink + plus2))
echo "$plus3" > /etc/usage/vmessgrpctls-downlink/"${user}"
else
echo "$downlink" > /etc/usage/vmessgrpctls-downlink/"${user}"
fi
xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>downlink" -reset > /dev/null 2>&1
fi
#get_uplink
result2=$(xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>uplink")
if echo "$result2" | grep -q "value"; then
uplink=$(echo "$result2" | grep -w "value" | awk '{print $2}' | tr -d '"')
if [ -e /etc/usage/vmessgrpctls-uplink/${user} ]; then
plus4=$(cat /etc/usage/vmessgrpctls-uplink/${user})
plus5=$((uplink + plus4))
echo "$plus5" > /etc/usage/vmessgrpctls-uplink/"${user}"
else
echo "$uplink" > /etc/usage/vmessgrpctls-uplink/"${user}"
fi
xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>uplink" -reset > /dev/null 2>&1
fi
done
done