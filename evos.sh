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

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
KEY=$(cat /etc/william/profile/key 2>/dev/null)
CHATID=$(cat /etc/william/profile/chatid 2>/dev/null)
if [[ -z $KEY || -z $CHATID ]]; then
echo "Please Fill API BOT & CHAT ID First !!"
exit
fi
if ! grep -q -w "ban-xray" /etc/crontab; then
echo -e "*/20 * * * * root ban-xray" >> /etc/crontab
/etc/init.d/cron restart
fi
if ! grep -q -w "ban-ssh" /etc/crontab; then
echo -e "*/3 * * * * root ban-ssh" >> /etc/crontab
/etc/init.d/cron restart
fi
domain=$(cat /etc/xray/domain)
datac=$(cat /usr/local/etc/xray/config.json | grep '###' | cut -d ' ' -f 2 | sort | uniq > /tmp/datac)
data69=$(cat /usr/local/etc/xray/will69.json | grep '###' | cut -d ' ' -f 2 | sort | uniq >> /tmp/datac)
datac666=$(cat /usr/local/etc/xray/will666.json | grep '###' | cut -d ' ' -f 2 | sort | uniq >> /tmp/datac)
datac6969=$(cat /usr/local/etc/xray/none.json | grep '###' | cut -d ' ' -f 2 | sort | uniq >> /tmp/datac)
data=$(cat /tmp/datac | sort -u)
for useractive in $data; do
ip_limit_vmessws=$(cat /etc/william/limit-xray/vmessws/$useractive 2>/dev/null)
ip_limit_trojanws=$(cat /etc/william/limit-xray/trojanws/$useractive 2>/dev/null)
ip_limit_vlessws=$(cat /etc/william/limit-xray/vlessws/$useractive 2>/dev/null)
date_1minute=$(date -R -d "1 minute ago" | awk '{print $5}' | cut -d: -f 1-2)
if grep -q -w "${useractive}" /var/log/xray/access.log || grep -q -w "${useractive}" /var/log/xray/access2.log; then
ip_list=$(cat /var/log/xray/access.log | grep -w "$useractive" | sed 's/:[^:]*$//' | awk {'print $2, $3, $5'} | grep -w "^${date_1minute}" | awk '{last[$2] = $0} END {for (key in last) print last[key]}' | awk {'print $1, $2, $3'} | awk '{last[$3] = $0} END {for (key in last) print last[key]}' | awk {'print $1, $2, $3'} | sed 's/:[^:]*$//' | sort -u | tr -d "[" | tr -d "]" | awk '!seen[$2]++' | sort -u | awk '{sub(/:[^:]*$/, " ", $2)}1' | awk {'print $1, $2, $3'} | awk '!seen[$2]++' | awk '!seen[$3]++' | sed 's/ / » /g' | sed 's/tcp://g' | sed 's/udp://g' | sed '/1.1.1.1/d' | sed '/1.0.0.1/d' | sed '/8.8.8.8/d' | sed '/8.8.4.4/d' | sed '/bing.com/d' | sed '/gstatic.com/d' | sed '/mtalk.google.com/d' | awk '!seen[$3]++' | sort -u)
cek_mulog=$(echo -e "$ip_list" | wc -l);
if [ -n "$ip_list" ]; then
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "━━━━━━━━[Monitoring User Xray TLS Login]━━━━━━━"
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "USERNAME : $useractive"
echo -e "${cyan}-------------------------------------------${NC}"
echo -e "$ip_list"
echo -e "${cyan}-------------------------------------------${NC}"
echo -e "$cek_mulog"
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
# MULOG VMESS WS
if [[ $cek_mulog -gt $ip_limit_vmessws && $ip_limit_vmessws -ne 0 ]]; then
ngecek_banned=$(cat /usr/local/etc/xray/config.json | grep -w "$useractive" | awk {'print $1'} | grep -w "#banned_vmessws" | wc -l)
if [[ "$ngecek_banned" = "1" ]]; then
echo -e "user already banned"
else
sed -i '/"email": "'"$useractive"'/s/,/#banned_vmessws ,/' /usr/local/etc/xray/config.json
sed -i '/"email": "'"$useractive"'/s/},/#banned_vmessws },/' /usr/local/etc/xray/none.json
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="
<b>━━━━━━━━━━━━━━━━━━</b>
<b>MULTI LOGIN VMESS WS</b>
<b>━━━━━━━━━━━━━━━━━━</b>
<b>Username: </b><code>$useractive</code>
<b>Domain: </b><code>$domain</code>
<b>Limit IP: </b><code>$ip_limit_vmessws</code>
<b>Multi Login IP: </b><code>$cek_mulog</code>
<b>Action: </b><code>BANNED</code>
<b>-----------------LOGS-----------------</b>
$ip_list
<b>-----------------------------------------</b>
<b>info : time on » ip » access</b>
<b>━━━━━━━━━━━━━━━━━━</b>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
systemctl restart xray
systemctl restart xray@none
fi
fi
# MULOG TROJAN WS
if [[ $cek_mulog -gt $ip_limit_trojanws && $ip_limit_trojanws -ne 0 ]]; then
ngecek_banned=$(cat /usr/local/etc/xray/config.json | grep -w "$useractive" | awk {'print $1'} | grep -w "#banned_trojanws" | wc -l)
if [[ "$ngecek_banned" = "1" ]]; then
echo -e "user already banned"
else
sed -i '/"email": "'"$useractive"'/s/,/#banned_trojanws ,/' /usr/local/etc/xray/config.json
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="
<b>━━━━━━━━━━━━━━━━━━</b>
<b>MULTI LOGIN TROJAN WS</b>
<b>━━━━━━━━━━━━━━━━━━</b>
<b>Username: </b><code>$useractive</code>
<b>Domain: </b><code>$domain</code>
<b>Limit IP: </b><code>$ip_limit_trojanws</code>
<b>Multi Login IP: </b><code>$cek_mulog</code>
<b>Action: </b><code>BANNED</code>
<b>-----------------LOGS-----------------</b>
$ip_list
<b>-----------------------------------------</b>
<b>info : time on » ip » access</b>
<b>━━━━━━━━━━━━━━━━━━</b>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
systemctl restart xray
fi
fi
# MULOG VLESS WS
if [[ $cek_mulog -gt $ip_limit_vlessws && $ip_limit_vlessws -ne 0 ]]; then
ngecek_banned=$(cat /usr/local/etc/xray/config.json | grep -w "$useractive" | awk {'print $1'} | grep -w "#banned_vlessws" | wc -l)
if [[ "$ngecek_banned" = "1" ]]; then
echo -e "user already banned"
else
sed -i '/"email": "'"$useractive"'/s/,/#banned_vlessws ,/' /usr/local/etc/xray/config.json
sed -i '/"email": "'"$useractive"'/s/},/#banned_vlessws },/' /usr/local/etc/xray/none.json
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="
<b>━━━━━━━━━━━━━━━━━━</b>
<b>MULTI LOGIN VLESS WS</b>
<b>━━━━━━━━━━━━━━━━━━</b>
<b>Username: </b><code>$useractive</code>
<b>Domain: </b><code>$domain</code>
<b>Limit IP: </b><code>$ip_limit_vlessws</code>
<b>Multi Login IP: </b><code>$cek_mulog</code>
<b>Action: </b><code>BANNED</code>
<b>-----------------LOGS-----------------</b>
$ip_list
<b>-----------------------------------------</b>
<b>info : time on » ip » access</b>
<b>━━━━━━━━━━━━━━━━━━</b>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
systemctl restart xray
systemctl restart xray@none
fi
fi
fi
#NTLS
ip_list2=$(cat /var/log/xray/access2.log | grep -w "$useractive" | sed 's/:[^:]*$//' | awk {'print $2, $3, $5'} | grep -w "^${date_1minute}" | awk '{last[$2] = $0} END {for (key in last) print last[key]}' | awk {'print $1, $2, $3'} | awk '{last[$3] = $0} END {for (key in last) print last[key]}' | awk {'print $1, $2, $3'} | sed 's/:[^:]*$//' | sort -u | tr -d "[" | tr -d "]" | awk '!seen[$2]++' | sort -u | awk '{sub(/:[^:]*$/, " ", $2)}1' | awk {'print $1, $2, $3'} | awk '!seen[$2]++' | awk '!seen[$3]++' | sed 's/ / » /g' | sed 's/tcp://g' | sed 's/udp://g' | sed '/1.1.1.1/d' | sed '/1.0.0.1/d' | sed '/8.8.8.8/d' | sed '/8.8.4.4/d' | sed '/bing.com/d' | sed '/gstatic.com/d' | sed '/mtalk.google.com/d' | awk '!seen[$3]++' | sort -u)
cek_mulog2=$(echo -e "$ip_list2" | wc -l)
if [ -n "$ip_list2" ]; then
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "━━━━━━━━[Monitoring User Xray NTLS Login]━━━━━━━"
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "USERNAME : $useractive"
echo -e "${cyan}-------------------------------------------${NC}"
echo -e "$ip_list2"
echo -e "${cyan}-------------------------------------------${NC}"
echo -e "$cek_mulog2"
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
# MULOG VMESS WS
if [[ $cek_mulog2 -gt $ip_limit_vmessws && $ip_limit_vmessws -ne 0 ]]; then
ngecek_banned=$(cat /usr/local/etc/xray/config.json | grep -w "$useractive" | awk {'print $1'} | grep -w "#banned_vmessws" | wc -l)
if [[ "$ngecek_banned" = "1" ]]; then
echo -e "user already banned"
else
sed -i '/"email": "'"$useractive"'/s/,/#banned_vmessws ,/' /usr/local/etc/xray/config.json
sed -i '/"email": "'"$useractive"'/s/},/#banned_vmessws },/' /usr/local/etc/xray/none.json
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="
<b>━━━━━━━━━━━━━━━━━━</b>
<b>MULTI LOGIN VMESS WS</b>
<b>━━━━━━━━━━━━━━━━━━</b>
<b>Username: </b><code>$useractive</code>
<b>Domain: </b><code>$domain</code>
<b>Limit IP: </b><code>$ip_limit_vmessws</code>
<b>Multi Login IP: </b><code>$cek_mulog2</code>
<b>Action: </b><code>BANNED</code>
<b>-----------------LOGS-----------------</b>
$ip_list2
<b>-----------------------------------------</b>
<b>info : time on » ip » access</b>
<b>━━━━━━━━━━━━━━━━━━</b>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
systemctl restart xray
systemctl restart xray@none
fi
fi
# MULOG VLESS WS
if [[ $cek_mulog2 -gt $ip_limit_vlessws && $ip_limit_vlessws -ne 0 ]]; then
ngecek_banned=$(cat /usr/local/etc/xray/config.json | grep -w "$useractive" | awk {'print $1'} | grep -w "#banned_vlessws" | wc -l)
if [[ "$ngecek_banned" = "1" ]]; then
echo -e "user already banned"
else
sed -i '/"email": "'"$useractive"'/s/,/#banned_vlessws ,/' /usr/local/etc/xray/config.json
sed -i '/"email": "'"$useractive"'/s/},/#banned_vlessws },/' /usr/local/etc/xray/none.json
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="
<b>━━━━━━━━━━━━━━━━━━</b>
<b>MULTI LOGIN VLESS WS</b>
<b>━━━━━━━━━━━━━━━━━━</b>
<b>Username: </b><code>$useractive</code>
<b>Domain: </b><code>$domain</code>
<b>Limit IP: </b><code>$ip_limit_vlessws</code>
<b>Multi Login IP: </b><code>$cek_mulog2</code>
<b>Action: </b><code>BANNED</code>
<b>-----------------LOGS-----------------</b>
$ip_list2
<b>-----------------------------------------</b>
<b>info : time on » ip » access</b>
<b>━━━━━━━━━━━━━━━━━━</b>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
systemctl restart xray
systemctl restart xray@none
fi
fi
fi
fi
done