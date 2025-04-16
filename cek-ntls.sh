#!/bin/bash
if [[ $(ulimit -c) != "0" ]]; then
  echo "Im Watching You..."
  echo "- @user_legend"
  exit 1
fi

red='\e[1;31m'
green='\e[0;32m'
kuning='\033[0;33m'
cyan='\033[0;36m'
biru='\e[0;34m'
oranye='\e[0;33m'
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

user_agents=(
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36"
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0"
  "Mozilla/5.0 (Macintosh; Intel Mac OS X 11_4_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36"
  "Mozilla/5.0 (Macintosh; Intel Mac OS X 11_4_0) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1 Safari/605.1.15"  "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0"
  "Mozilla/5.0 (Linux; Android 11; SM-G998U) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.120 Mobile Safari/537.36"
  "Mozilla/5.0 (Linux; Android 11; SM-G998U) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Mobile Safari/537.36"
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36"
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0"
  "Mozilla/5.0 (Macintosh; Intel Mac OS X 11_6_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36"
  "Mozilla/5.0 (Macintosh; Intel Mac OS X 11_6_0) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15"
  "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:93.0) Gecko/20100101 Firefox/93.0"
  "Mozilla/5.0 (Linux; Android 11; SM-G998U) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36"
  "Mozilla/5.0 (Linux; Android 12; SM-G998U) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4758.101 Mobile Safari/537.36",
  "Mozilla/5.0 (Linux; Android 12; Pixel 6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.125 Mobile Safari/537.36",
  "Mozilla/5.0 (Linux; Android 12; OnePlus 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4758.92 Mobile Safari/537.36",
  "Mozilla/5.0 (Linux; Android 12; Samsung Galaxy S22) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4758.80 Mobile Safari/537.36",
  "Mozilla/5.0 (Linux; Android 12; Xiaomi Mi 11) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.78 Mobile Safari/537.36",
  "Mozilla/5.0 (Linux; Android 12; Sony Xperia 1 III) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4758.60 Mobile Safari/537.36",
  "Mozilla/5.0 (Linux; Android 12; Oppo Find X3 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.125 Mobile Safari/537.36"
)
random_user_agent=${user_agents[$RANDOM % ${#user_agents[@]}]}

declare -A ip_by_user
date_1minute=$(date -R -d "1 minute ago" | awk '{print $5}' | cut -d: -f 1-2)
date_now=$(date -R -d "now" | awk '{print $5}' | cut -d: -f 1-2)
data=( `cat /usr/local/etc/xray/config.json | grep '###' | cut -d ' ' -f 2 | sort | uniq`);
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "━━━━━━━━[Monitoring User Xray NTLS Login]━━━━━━━"
for useractive in "${data[@]}"
do
validasi_real_login=$(cat /var/log/xray/access2.log | grep -w "$useractive" | sed 's/tcp://g' | sed 's/:[^:]*$//' | awk {'print $2, $3'} | grep -w "^${date_1minute}\|^${date_now}" | awk '{last[$2] = $0} END {for (key in last) print last[key]}' | sort -u | awk {'print $2'})
if [ -n "$validasi_real_login" ]; then
if grep -q -w "$useractive" /var/log/xray/access2.log; then
# -- BW -- #
# VMESS WS NTLS
if [[ -e /etc/usage/vmesswsntls-uplink/${useractive} ]]; then
byt1_vmesswsntls=$(cat /etc/usage/vmesswsntls-downlink/${useractive})
byt2_vmesswsntls=$(cat /etc/usage/vmesswsntls-uplink/${useractive})
num1_vmesswsntls=$((byt1_vmesswsntls))
num2_vmesswsntls=$((byt2_vmesswsntls))
sum_vmesswsntls=$((num1_vmesswsntls + num2_vmesswsntls))
if (( sum_vmesswsntls >= 1024*1024*1024*1024 )); then
size_in_gb_vmesswsntls=$(echo "scale=2; $sum_vmesswsntls/1024/1024/1024/1024" | bc)
size_unit_vmesswsntls="TB"
elif (( sum_vmesswsntls >= 1024*1024*1024 )); then
size_in_gb_vmesswsntls=$(echo "scale=2; $sum_vmesswsntls/1024/1024/1024" | bc)
size_unit_vmesswsntls="GB"
elif (( sum_vmesswsntls >= 1024*1024 )); then
size_in_gb_vmesswsntls=$(echo "scale=2; $sum_vmesswsntls/1024/1024" | bc)
size_unit_vmesswsntls="MB"
else
size_in_gb_vmesswsntls=$(echo "scale=2; $sum_vmesswsntls/1024" | bc)
size_unit_vmesswsntls="KB"
fi
else
size_in_gb_vmesswsntls=""
size_unit_vmesswsntls=""
fi
# VLESS WS NTLS
if [[ -e /etc/usage/vlesswsntls-uplink/${useractive} ]]; then
byt1_vlesswsntls=$(cat /etc/usage/vlesswsntls-downlink/${useractive})
byt2_vlesswsntls=$(cat /etc/usage/vlesswsntls-uplink/${useractive})
num1_vlesswsntls=$((byt1_vlesswsntls))
num2_vlesswsntls=$((byt2_vlesswsntls))
sum_vlesswsntls=$((num1_vlesswsntls + num2_vlesswsntls))
if (( sum_vlesswsntls >= 1024*1024*1024*1024 )); then
size_in_gb_vlesswsntls=$(echo "scale=2; $sum_vlesswsntls/1024/1024/1024/1024" | bc)
size_unit_vlesswsntls="TB"
elif (( sum_vlesswsntls >= 1024*1024*1024 )); then
size_in_gb_vlesswsntls=$(echo "scale=2; $sum_vlesswsntls/1024/1024/1024" | bc)
size_unit_vlesswsntls="GB"
elif (( sum_vlesswsntls >= 1024*1024 )); then
size_in_gb_vlesswsntls=$(echo "scale=2; $sum_vlesswsntls/1024/1024" | bc)
size_unit_vlesswsntls="MB"
else
size_in_gb_vlesswsntls=$(echo "scale=2; $sum_vlesswsntls/1024" | bc)
size_unit_vlesswsntls="KB"
fi
else
size_in_gb_vlesswsntls=""
size_unit_vlesswsntls=""
fi
# -- BW -- #
    loglines_doang=$(cat /var/log/xray/access2.log | grep -w "$useractive" | sort -u | wc -l)
    echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "USERNAME : $useractive"
# -- OUTPUT BW -- #
if [[ -s /etc/usage/vmesswsntls-uplink/${useractive} ]]; then
    echo -e "Quota Usage (VMESS WS NTLS) : ${green}$size_in_gb_vmesswsntls $size_unit_vmesswsntls${NC}"
elif [[ -s /etc/usage/vlesswsntls-uplink/${useractive} ]]; then
    echo -e "Quota Usage (VLESS WS NTLS) : ${green}$size_in_gb_vlesswsntls $size_unit_vlesswsntls${NC}"
else
    echo -e "Quota Usage : ${green}${useractive}${NC} ${red}Tidak Terdeteksi/Belum Support${NC}"
fi
# -- OUTPUT BW -- #
    echo -e "IP LOGIN   ▼"
    echo -e "${cyan}-------------------------------------------------${NC}"
    echo -e "TIME ON   >    IP LOGIN      >    ISP|CITY         >     ACCESS"
    echo -e "${cyan}-------------------------------------------------${NC}"
    ip_info_city=$(cat /var/log/xray/access2.log | grep -w "${useractive}" | sed 's/tcp://g' | sed 's/:[^:]*$//' | awk {'print $2, $3, $5'} | grep -w "^${date_1minute}\|^${date_now}" | awk '{last[$2] = $0} END {for (key in last) print last[key]}' | awk {'print $2'} | sed 's/:[^:]*$//' | sort -u | tr -d "[" | tr -d "]")
    ip_infoooo=$(cat /var/log/xray/access2.log | grep -w "${useractive}" | sed 's/tcp://g' | sed 's/:[^:]*$//' | awk {'print $2, $3, $5'} | grep -w "^${date_1minute}\|^${date_now}" | awk '{last[$2] = $0} END {for (key in last) print last[key]}' | awk {'print $2'} | sed 's/:[^:]*$//' | sort -u | tr -d "[" | tr -d "]" | wc -l)
    for ip in $ip_info_city; do
    timestamp=$(cat /var/log/xray/access2.log | grep -w "${ip}" | sed 's/tcp://g' | sed 's/:[^:]*$//' | awk {'print $2, $3, $5'} | grep -w "^${date_1minute}\|^${date_now}" | awk '{last[$2] = $0} END {for (key in last) print last[key]}' | awk {'print $1'})
    access=$(cat /var/log/xray/access2.log | grep -w "${ip}" | sed 's/tcp://g' | sed 's/:[^:]*$//' | awk {'print $2, $3, $5'} | grep -w "^${date_1minute}\|^${date_now}" | awk '{last[$2] = $0} END {for (key in last) print last[key]}' | awk {'print $3'})
    city=$(curl -sS --compressed -A "$random_user_agent" --max-time 7 http://ip-api.com/json/${ip} | jq .city | tr -d '"')
    isp_provider=$(curl -sS --compressed -A "$random_user_agent" --max-time 7 http://ip-api.com/json/${ip} | jq .as | tr -d '"' | awk {'print $2, $3, $4, $5'})
    if [[ $isp_provider == *"XL"* ]]; then
    isp_ingfo="${biru}XL/Axis/LiveON${NC}"
    elif [[ $isp_provider == *"Telekomunikasi"* ]]; then
    isp_ingfo="${red}TSEL/byU${NC}"
    elif [[ $isp_provider == *"INDOSAT"* ]]; then
    isp_ingfo="${kuning}ISAT/TRI${NC}"
    elif [[ $isp_provider == *"DiGi"* ]]; then
    isp_ingfo="${kuning}DIGI${NC}"
    fi
    output=$(printf "%-9s » %-15s » %-10s » %s\n" "$timestamp" "$ip" "${isp_ingfo}|$city" "$access" | awk 'NF >= 3')
    echo -e "$output"
    done
    echo -e "${cyan}-------------------------------------------------${NC}"
    echo -e "IP Login : $ip_infoooo"
    echo -e "LOG LINES : $loglines_doang"
    echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
  fi
fi
done

