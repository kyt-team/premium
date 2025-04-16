cv #!/bin/bash
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
#get_data TROJAN WS
data=($(grep -E -w "TrojanWS " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq))
for user in "${data[@]}"; do
#create_folder
if [[ ! -e /etc/usage/trojanws-downlink ]]; then
mkdir -p /etc/usage/trojanws-downlink
fi
if [[ ! -e /etc/usage/trojanws-uplink ]]; then
mkdir -p /etc/usage/trojanws-uplink
fi
#get_downlink
result=$(xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>downlink")
if echo "$result" | grep -q "value"; then
downlink=$(echo "$result" | grep -w "value" | awk '{print $2}' | tr -d '"')
if [ -e /etc/usage/trojanws-downlink/${user} ]; then
plus2=$(cat /etc/usage/trojanws-downlink/${user})
plus3=$((downlink + plus2))
echo "$plus3" > /etc/usage/trojanws-downlink/"${user}"
else
echo "$downlink" > /etc/usage/trojanws-downlink/"${user}"
fi
xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>downlink" -reset > /dev/null 2>&1
fi
#get_uplink
result2=$(xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>uplink")
if echo "$result2" | grep -q "value"; then
uplink=$(echo "$result2" | grep -w "value" | awk '{print $2}' | tr -d '"')
if [ -e /etc/usage/trojanws-uplink/${user} ]; then
plus4=$(cat /etc/usage/trojanws-uplink/${user})
plus5=$((uplink + plus4))
echo "$plus5" > /etc/usage/trojanws-uplink/"${user}"
else
echo "$uplink" > /etc/usage/trojanws-uplink/"${user}"
fi
xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>uplink" -reset > /dev/null 2>&1
fi
done
#get_data TROJAN TCP
data=($(grep -E -w "Trojan " "/usr/local/etc/xray/will69.json" | cut -d ' ' -f 2 | sort | uniq))
for user in "${data[@]}"; do
#create_folder
if [[ ! -e /etc/usage/trojan-downlink ]]; then
mkdir -p /etc/usage/trojan-downlink
fi
if [[ ! -e /etc/usage/trojan-uplink ]]; then
mkdir -p /etc/usage/trojan-uplink
fi
#get_downlink
result=$(xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>downlink")
if echo "$result" | grep -q "value"; then
downlink=$(echo "$result" | grep -w "value" | awk '{print $2}' | tr -d '"')
if [ -e /etc/usage/trojan-downlink/${user} ]; then
plus2=$(cat /etc/usage/trojan-downlink/${user})
plus3=$((downlink + plus2))
echo "$plus3" > /etc/usage/trojan-downlink/"${user}"
else
echo "$downlink" > /etc/usage/trojan-downlink/"${user}"
fi
xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>downlink" -reset > /dev/null 2>&1
fi
#get_uplink
result2=$(xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>uplink")
if echo "$result2" | grep -q "value"; then
uplink=$(echo "$result2" | grep -w "value" | awk '{print $2}' | tr -d '"')
if [ -e /etc/usage/trojan-uplink/${user} ]; then
plus4=$(cat /etc/usage/trojan-uplink/${user})
plus5=$((uplink + plus4))
echo "$plus5" > /etc/usage/trojan-uplink/"${user}"
else
echo "$uplink" > /etc/usage/trojan-uplink/"${user}"
fi
xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>uplink" -reset > /dev/null 2>&1
fi
done
#get_data TrojanGRPC
data=($(grep -E -w "TrojanGRPC " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq))
for user in "${data[@]}"; do
#create_folder
if [[ ! -e /etc/usage/trojangrpctls-downlink ]]; then
mkdir -p /etc/usage/trojangrpctls-downlink
fi
if [[ ! -e /etc/usage/trojangrpctls-uplink ]]; then
mkdir -p /etc/usage/trojangrpctls-uplink
fi
#get_downlink
result=$(xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>downlink")
if echo "$result" | grep -q "value"; then
downlink=$(echo "$result" | grep -w "value" | awk '{print $2}' | tr -d '"')
if [ -e /etc/usage/trojangrpctls-downlink/${user} ]; then
plus2=$(cat /etc/usage/trojangrpctls-downlink/${user})
plus3=$((downlink + plus2))
echo "$plus3" > /etc/usage/trojangrpctls-downlink/"${user}"
else
echo "$downlink" > /etc/usage/trojangrpctls-downlink/"${user}"
fi
xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>downlink" -reset > /dev/null 2>&1
fi
#get_uplink
result2=$(xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>uplink")
if echo "$result2" | grep -q "value"; then
uplink=$(echo "$result2" | grep -w "value" | awk '{print $2}' | tr -d '"')
if [ -e /etc/usage/trojangrpctls-uplink/${user} ]; then
plus4=$(cat /etc/usage/trojangrpctls-uplink/${user})
plus5=$((uplink + plus4))
echo "$plus5" > /etc/usage/trojangrpctls-uplink/"${user}"
else
echo "$uplink" > /etc/usage/trojangrpctls-uplink/"${user}"
fi
xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>uplink" -reset > /dev/null 2>&1
fi
done
done