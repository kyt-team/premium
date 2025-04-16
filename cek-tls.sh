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
  "Mozilla/5.0 (Linux; Android 12; Sony Xperia 1 III) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4758.60 Mobile Safari/537.36",  "Mozilla/5.0 (Linux; Android 12; Oppo Find X3 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.125 Mobile Safari/537.36"
)
random_user_agent=${user_agents[$RANDOM % ${#user_agents[@]}]}

declare -A ip_by_user
date_1minute=$(date -R -d "1 minute ago" | awk '{print $5}' | cut -d: -f 1-2)
date_now=$(date -R -d "now" | awk '{print $5}' | cut -d: -f 1-2)
datac=$(cat /usr/local/etc/xray/config.json | grep '###' | cut -d ' ' -f 2 | sort | uniq > /tmp/datac)
data69=$(cat /usr/local/etc/xray/will69.json | grep '###' | cut -d ' ' -f 2 | sort | uniq >> /tmp/datac)
datac666=$(cat /usr/local/etc/xray/will666.json | grep '###' | cut -d ' ' -f 2 | sort | uniq >> /tmp/datac)
data=$(cat /tmp/datac | sort -u)
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "━━━━━━━━[Monitoring User Xray TLS Login]━━━━━━━━"
for useractive in $data; do
validasi_real_login=$(cat /var/log/xray/access.log | grep -w "$useractive" | sed 's/tcp://g' | sed 's/:[^:]*$//' | awk {'print $2, $3'} | grep -w "^${date_1minute}\|^${date_now}" | awk '{last[$2] = $0} END {for (key in last) print last[key]}' | sort -u | awk {'print $2'})
if [ -n "$validasi_real_login" ]; then
if grep -q -w "$useractive" /var/log/xray/access.log; then
# -- BW -- #
# TROJAN WS TLS
if [[ -e /etc/usage/trojanws-uplink/${useractive} ]]; then
byt1_trojanws=$(cat /etc/usage/trojanws-downlink/${useractive})
byt2_trojanws=$(cat /etc/usage/trojanws-uplink/${useractive})
sum_trojanws=$((byt1_trojanws + byt2_trojanws))
if (( sum_trojanws >= 1024*1024*1024*1024 )); then
size_in_gb_total_trojanws=$(echo "scale=2; $sum_trojanws/1024/1024/1024/1024" | bc)
size_unit_total_trojanws="TB"
elif (( sum_trojanws >= 1024*1024*1024 )); then
size_in_gb_total_trojanws=$(echo "scale=2; $sum_trojanws/1024/1024/1024" | bc)
size_unit_total_trojanws="GB"
elif (( sum_trojanws >= 1024*1024 )); then
size_in_gb_total_trojanws=$(echo "scale=2; $sum_trojanws/1024/1024" | bc)
size_unit_total_trojanws="MB"
else
size_in_gb_total_trojanws=$(echo "scale=2; $sum_trojanws/1024" | bc)
size_unit_total_trojanws="KB"
fi
else
size_in_gb_total_trojanws=""
size_unit_total_trojanws=""
fi
# TROJAN TCP TLS
if [[ -e /etc/usage/trojan-uplink/${useractive} ]]; then
byt1_trojan=$(cat /etc/usage/trojan-downlink/${useractive})
byt2_trojan=$(cat /etc/usage/trojan-uplink/${useractive})
sum_trojan=$((byt1_trojan + byt2_trojan))
if (( sum_trojan >= 1024*1024*1024*1024 )); then
size_in_gb_total_trojan=$(echo "scale=2; $sum_trojan/1024/1024/1024/1024" | bc)
size_unit_total_trojan="TB"
elif (( sum_trojan >= 1024*1024*1024 )); then
size_in_gb_total_trojan=$(echo "scale=2; $sum_trojan/1024/1024/1024" | bc)
size_unit_total_trojan="GB"
elif (( sum_trojan >= 1024*1024 )); then
size_in_gb_total_trojan=$(echo "scale=2; $sum_trojan/1024/1024" | bc)
size_unit_total_trojan="MB"
else
size_in_gb_total_trojan=$(echo "scale=2; $sum_trojan/1024" | bc)
size_unit_total_trojan="KB"
fi
else
size_in_gb_total_trojan=""
size_unit_total_trojan=""
fi
# VMESS WS TLS
if [[ -e /etc/usage/vmesswstls-uplink/${useractive} ]]; then
byt1_vmesswstls=$(cat /etc/usage/vmesswstls-downlink/${useractive})
byt2_vmesswstls=$(cat /etc/usage/vmesswstls-uplink/${useractive})
num1_vmesswstls=$((byt1_vmesswstls))
num2_vmesswstls=$((byt2_vmesswstls))
sum_vmesswstls=$((num1_vmesswstls + num2_vmesswstls))
if (( sum_vmesswstls >= 1024*1024*1024*1024 )); then
size_in_gb_vmesswstls=$(echo "scale=2; $sum_vmesswstls/1024/1024/1024/1024" | bc)
size_unit_vmesswstls="TB"
elif (( sum_vmesswstls >= 1024*1024*1024 )); then
size_in_gb_vmesswstls=$(echo "scale=2; $sum_vmesswstls/1024/1024/1024" | bc)
size_unit_vmesswstls="GB"
elif (( sum_vmesswstls >= 1024*1024 )); then
size_in_gb_vmesswstls=$(echo "scale=2; $sum_vmesswstls/1024/1024" | bc)
size_unit_vmesswstls="MB"
else
size_in_gb_vmesswstls=$(echo "scale=2; $sum_vmesswstls/1024" | bc)
size_unit_vmesswstls="KB"
fi
else
size_in_gb_vmesswstls=""
size_unit_vmesswstls=""
fi
# VLESS WS TLS
if [[ -e /etc/usage/vlesswstls-uplink/${useractive} ]]; then
byt1_vlesswstls=$(cat /etc/usage/vlesswstls-downlink/${useractive})
byt2_vlesswstls=$(cat /etc/usage/vlesswstls-uplink/${useractive})
num1_vlesswstls=$((byt1_vlesswstls))
num2_vlesswstls=$((byt2_vlesswstls))
sum_vlesswstls=$((num1_vlesswstls + num2_vlesswstls))
if (( sum_vlesswstls >= 1024*1024*1024*1024 )); then
size_in_gb_vlesswstls=$(echo "scale=2; $sum_vlesswstls/1024/1024/1024/1024" | bc)
size_unit_vlesswstls="TB"
elif (( sum_vlesswstls >= 1024*1024*1024 )); then
size_in_gb_vlesswstls=$(echo "scale=2; $sum_vlesswstls/1024/1024/1024" | bc)
size_unit_vlesswstls="GB"
elif (( sum_vlesswstls >= 1024*1024 )); then
size_in_gb_vlesswstls=$(echo "scale=2; $sum_vlesswstls/1024/1024" | bc)
size_unit_vlesswstls="MB"
else
size_in_gb_vlesswstls=$(echo "scale=2; $sum_vlesswstls/1024" | bc)
size_unit_vlesswstls="KB"
fi
else
size_in_gb_vlesswstls=""
size_unit_vlesswstls=""
fi
# VLESS GRPC TLS
if [[ -e /etc/usage/vlessgrpctls-uplink/${useractive} ]]; then
byt1_vlessgrpctls=$(cat /etc/usage/vlessgrpctls-downlink/${useractive})
byt2_vlessgrpctls=$(cat /etc/usage/vlessgrpctls-uplink/${useractive})
num1_vlessgrpctls=$((byt1_vlessgrpctls))
num2_vlessgrpctls=$((byt2_vlessgrpctls))
sum_vlessgrpctls=$((num1_vlessgrpctls + num2_vlessgrpctls))
if (( sum_vlessgrpctls >= 1024*1024*1024*1024 )); then
size_in_gb_vlessgrpctls=$(echo "scale=2; $sum_vlessgrpctls/1024/1024/1024/1024" | bc)
size_unit_vlessgrpctls="TB"
elif (( sum_vlessgrpctls >= 1024*1024*1024 )); then
size_in_gb_vlessgrpctls=$(echo "scale=2; $sum_vlessgrpctls/1024/1024/1024" | bc)
size_unit_vlessgrpctls="GB"
elif (( sum_vlessgrpctls >= 1024*1024 )); then
size_in_gb_vlessgrpctls=$(echo "scale=2; $sum_vlessgrpctls/1024/1024" | bc)
size_unit_vlessgrpctls="MB"
else
size_in_gb_vlessgrpctls=$(echo "scale=2; $sum_vlessgrpctls/1024" | bc)
size_unit_vlessgrpctls="KB"
fi
else
size_in_gb_vlessgrpctls=""
size_unit_vlessgrpctls=""
fi
# VLESS XTLS
if [[ -e /etc/usage/vlessxtls-uplink/${useractive} ]]; then
byt1_vlessxtls=$(cat /etc/usage/vlessxtls-downlink/${useractive})
byt2_vlessxtls=$(cat /etc/usage/vlessxtls-uplink/${useractive})
num1_vlessxtls=$((byt1_vlessxtls))
num2_vlessxtls=$((byt2_vlessxtls))
sum_vlessxtls=$((num1_vlessxtls + num2_vlessxtls))
if (( sum_vlessxtls >= 1024*1024*1024*1024 )); then
size_in_gb_vlessxtls=$(echo "scale=2; $sum_vlessxtls/1024/1024/1024/1024" | bc)
size_unit_vlessxtls="TB"
elif (( sum_vlessxtls >= 1024*1024*1024 )); then
size_in_gb_vlessxtls=$(echo "scale=2; $sum_vlessxtls/1024/1024/1024" | bc)
size_unit_vlessxtls="GB"
elif (( sum_vlessxtls >= 1024*1024 )); then
size_in_gb_vlessxtls=$(echo "scale=2; $sum_vlessxtls/1024/1024" | bc)
size_unit_vlessxtls="MB"
else
size_in_gb_vlessxtls=$(echo "scale=2; $sum_vlessxtls/1024" | bc)
size_unit_vlessxtls="KB"
fi
else
size_in_gb_vlessxtls=""
size_unit_vlessxtls=""
fi
# VMESS GRPC
if [[ -e /etc/usage/vmessgrpctls-uplink/${useractive} ]]; then
byt1_vmessgrpctls=$(cat /etc/usage/vmessgrpctls-downlink/${useractive})
byt2_vmessgrpctls=$(cat /etc/usage/vmessgrpctls-uplink/${useractive})
num1_vmessgrpctls=$((byt1_vmessgrpctls))
num2_vmessgrpctls=$((byt2_vmessgrpctls))
sum_vmessgrpctls=$((num1_vmessgrpctls + num2_vmessgrpctls))
if (( sum_vmessgrpctls >= 1024*1024*1024*1024 )); then
size_in_gb_vmessgrpctls=$(echo "scale=2; $sum_vmessgrpctls/1024/1024/1024/1024" | bc)
size_unit_vmessgrpctls="TB"
elif (( sum_vmessgrpctls >= 1024*1024*1024 )); then
size_in_gb_vmessgrpctls=$(echo "scale=2; $sum_vmessgrpctls/1024/1024/1024" | bc)
size_unit_vmessgrpctls="GB"
elif (( sum_vmessgrpctls >= 1024*1024 )); then
size_in_gb_vmessgrpctls=$(echo "scale=2; $sum_vmessgrpctls/1024/1024" | bc)
size_unit_vmessgrpctls="MB"
else
size_in_gb_vmessgrpctls=$(echo "scale=2; $sum_vmessgrpctls/1024" | bc)
size_unit_vmessgrpctls="KB"
fi
else
size_in_gb_vmessgrpctls=""
size_unit_vmessgrpctls=""
fi
# VMESS TCP HTTP
if [[ -e /etc/usage/vmesstcphttp-uplink/${useractive} ]]; then
byt1_vmesstcphttp=$(cat /etc/usage/vmesstcphttp-downlink/${useractive})
byt2_vmesstcphttp=$(cat /etc/usage/vmesstcphttp-uplink/${useractive})
num1_vmesstcphttp=$((byt1_vmesstcphttp))
num2_vmesstcphttp=$((byt2_vmesstcphttp))
sum_vmesstcphttp=$((num1_vmesstcphttp + num2_vmesstcphttp))
if (( sum_vmesstcphttp >= 1024*1024*1024*1024 )); then
size_in_gb_vmesstcphttp=$(echo "scale=2; $sum_vmesstcphttp/1024/1024/1024/1024" | bc)
size_unit_vmesstcphttp="TB"
elif (( sum_vmesstcphttp >= 1024*1024*1024 )); then
size_in_gb_vmesstcphttp=$(echo "scale=2; $sum_vmesstcphttp/1024/1024/1024" | bc)
size_unit_vmesstcphttp="GB"
elif (( sum_vmesstcphttp >= 1024*1024 )); then
size_in_gb_vmesstcphttp=$(echo "scale=2; $sum_vmesstcphttp/1024/1024" | bc)
size_unit_vmesstcphttp="MB"
else
size_in_gb_vmesstcphttp=$(echo "scale=2; $sum_vmesstcphttp/1024" | bc)
size_unit_vmesstcphttp="KB"
fi
else
size_in_gb_vmesstcphttp=""
size_unit_vmesstcphttp=""
fi
# TROJAN GRPC
if [[ -e /etc/usage/trojangrpctls-uplink/${useractive} ]]; then
byt1_trojangrpctls=$(cat /etc/usage/trojangrpctls-downlink/${useractive})
byt2_trojangrpctls=$(cat /etc/usage/trojangrpctls-uplink/${useractive})
num1_trojangrpctls=$((byt1_trojangrpctls))
num2_trojangrpctls=$((byt2_trojangrpctls))
sum_trojangrpctls=$((num1_trojangrpctls + num2_trojangrpctls))
if (( sum_trojangrpctls >= 1024*1024*1024*1024 )); then
size_in_gb_trojangrpctls=$(echo "scale=2; $sum_trojangrpctls/1024/1024/1024/1024" | bc)
size_unit_trojangrpctls="TB"
elif (( sum_trojangrpctls >= 1024*1024*1024 )); then
size_in_gb_trojangrpctls=$(echo "scale=2; $sum_trojangrpctls/1024/1024/1024" | bc)
size_unit_trojangrpctls="GB"
elif (( sum_trojangrpctls >= 1024*1024 )); then
size_in_gb_trojangrpctls=$(echo "scale=2; $sum_trojangrpctls/1024/1024" | bc)
size_unit_trojangrpctls="MB"
else
size_in_gb_trojangrpctls=$(echo "scale=2; $sum_trojangrpctls/1024" | bc)
size_unit_trojangrpctls="KB"
fi
else
size_in_gb_trojangrpctls=""
size_unit_trojangrpctls=""
fi
# -- BW -- #
    loglines_doang=$(cat /var/log/xray/access.log | grep -w "$useractive" | sort -u | wc -l)
    echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "USERNAME : $useractive"
# -- OUTPUT BW -- #
if [[ -s /etc/usage/trojanws-uplink/${useractive} ]]; then
    echo -e "Quota Usage (TROJAN WS TLS) : ${green}$size_in_gb_total_trojanws $size_unit_total_trojanws${NC} [TOTAL ${biru}IN${NC} & ${oranye}OUT${NC}]"
elif [[ -s /etc/usage/trojan-uplink/${useractive} ]]; then
    echo -e "Quota Usage (TROJAN TCP TLS) : ${green}$size_in_gb_total_trojan $size_unit_total_trojan${NC} [TOTAL ${biru}IN${NC} & ${oranye}OUT${NC}]"
elif [[ -s /etc/usage/trojangrpctls-uplink/${useractive} ]]; then
    echo -e "Quota Usage (TROJAN GRPC TLS) : ${green}$size_in_gb_trojangrpctls $size_unit_trojangrpctls${NC} [TOTAL ${biru}IN${NC} & ${oranye}OUT${NC}]"
elif [[ -s /etc/usage/vmesswstls-uplink/${useractive} ]]; then
    echo -e "Quota Usage (VMESS WS TLS) : ${green}$size_in_gb_vmesswstls $size_unit_vmesswstls${NC} [TOTAL ${biru}IN${NC} & ${oranye}OUT${NC}]"
elif [[ -s /etc/usage/vmessgrpctls-uplink/${useractive} ]]; then
    echo -e "Quota Usage (VMESS GRPC TLS) : ${green}$size_in_gb_vmessgrpctls $size_unit_vmessgrpctls${NC} [TOTAL ${biru}IN${NC} & ${oranye}OUT${NC}]"
elif [[ -s /etc/usage/vmesstcphttp-uplink/${useractive} ]]; then
    echo -e "Quota Usage (VMESS TCP HTTP) : ${green}$size_in_gb_vmesstcphttp $size_unit_vmesstcphttp${NC} [TOTAL ${biru}IN${NC} & ${oranye}OUT${NC}]"
elif [[ -s /etc/usage/vlesswstls-uplink/${useractive} ]]; then
    echo -e "Quota Usage (VLESS WS TLS) : ${green}$size_in_gb_vlesswstls $size_unit_vlesswstls${NC} [TOTAL ${biru}IN${NC} & ${oranye}OUT${NC}]"
elif [[ -s /etc/usage/vlessgrpctls-uplink/${useractive} ]]; then
    echo -e "Quota Usage (VLESS GRPC TLS) : ${green}$size_in_gb_vlessgrpctls $size_unit_vlessgrpctls${NC} [TOTAL ${biru}IN${NC} & ${oranye}OUT${NC}]"
elif [[ -s /etc/usage/vlessxtls-uplink/${useractive} ]]; then
    echo -e "Quota Usage (VLESS TCP XTLS) : ${green}$size_in_gb_vlessxtls $size_unit_vlessxtls${NC} [TOTAL ${biru}IN${NC} & ${oranye}OUT${NC}]"
else
    echo -e "Quota Usage : ${green}${useractive}${NC} ${red}Tidak Terdeteksi/Belum Support${NC}"
fi
# -- OUTPUT BW -- #
    echo -e "IP LOGIN   ▼"
    echo -e "${cyan}-------------------------------------------------${NC}"
    echo -e "TIME ON   >    IP LOGIN      >    ISP|CITY         >     ACCESS"
    echo -e "${cyan}-------------------------------------------------${NC}"
    ip_info_city=$(cat /var/log/xray/access.log | grep -w "${useractive}" | sed 's/tcp://g' | sed 's/:[^:]*$//' | awk {'print $2, $3, $5'} | grep -w "^${date_1minute}\|^${date_now}" | awk '{last[$2] = $0} END {for (key in last) print last[key]}' | awk {'print $2'} | sed 's/:[^:]*$//' | sort -u | tr -d "[" | tr -d "]")
    ip_infoooo=$(cat /var/log/xray/access.log | grep -w "${useractive}" | sed 's/tcp://g' | sed 's/:[^:]*$//' | awk {'print $2, $3, $5'} | grep -w "^${date_1minute}\|^${date_now}" | awk '{last[$2] = $0} END {for (key in last) print last[key]}' | awk {'print $2'} | sed 's/:[^:]*$//' | sort -u | tr -d "[" | tr -d "]" | wc -l)
    for ip in $ip_info_city; do
    timestamp=$(cat /var/log/xray/access.log | grep -w "${ip}" | sed 's/tcp://g' | sed 's/:[^:]*$//' | awk {'print $2, $3, $5'} | grep -w "^${date_1minute}\|^${date_now}" | awk '{last[$2] = $0} END {for (key in last) print last[key]}' | awk {'print $1'})
    access=$(cat /var/log/xray/access.log | grep -w "${ip}" | sed 's/tcp://g' | sed 's/:[^:]*$//' | awk {'print $2, $3, $5'} | grep -w "^${date_1minute}\|^${date_now}" | awk '{last[$2] = $0} END {for (key in last) print last[key]}' | awk {'print $3'})
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
