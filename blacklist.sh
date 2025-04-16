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
export PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin'
if ! grep -q -w "ban-ssh" /etc/crontab; then
echo "*/3 * * * * root ban-ssh" >> /etc/crontab
/etc/init.d/cron restart
fi
domain=$(cat /etc/xray/domain)
KEY=$(cat /etc/william/profile/key 2>/dev/null)
CHATID=$(cat /etc/william/profile/chatid 2>/dev/null)
if [[ -z $KEY || -z $CHATID ]]; then
echo "Please Fill API BOT & CHAT ID First !!"
exit
fi
if [ -e "/var/log/auth.log" ]; then
        LOG="/var/log/auth.log";
fi
if [ -e "/var/log/secure" ]; then
        LOG="/var/log/secure";
fi
#DROPBEAR
data=( `ps aux | grep -i dropbear | awk '{print $2}'`);
cat $LOG | grep -i dropbear | grep -i "Password auth succeeded" > /tmp/login-db.txt;
for PID in "${data[@]}"
do
cat /tmp/login-db.txt | grep "dropbear\[$PID\]" > /tmp/login-db-pid.txt;
NUM=`cat /tmp/login-db-pid.txt | wc -l`;
USER=`cat /tmp/login-db-pid.txt | awk '{print $10}'`;
IP=`cat /tmp/login-db-pid.txt | awk '{print $12}'`;
if [ $NUM -eq 1 ]; then
echo "$PID - $USER - $IP";
fi
done > /tmp/login_dropbear.txt
MYUSER=$(cat /tmp/login_dropbear.txt | awk {'print $3'} | tr -d "'" | sort -u)
for user in $MYUSER; do
ip_limit_ssh=$(cat /etc/william/limit-ssh/$user 2>/dev/null)
cek_mulog_dropbear=$(cat /tmp/login_dropbear.txt | grep -w "$user" | wc -l)
echo -e "======================="
echo -e "AUTOBAN MULTI LOGIN SSH"
echo -e "======================="
echo -e "user : $user"
echo -e "limit login : $ip_limit_ssh"
echo -e "ip login : $cek_mulog_dropbear"
echo -e "======================="
echo ""
if [[ $cek_mulog_dropbear -gt $ip_limit_ssh && $ip_limit_ssh -ne 0 ]]; then
ngecek_banned=$(cat /etc/william/udp/listbanned-ssh.conf | grep -w "$user" | wc -l)
if [[ "$ngecek_banned" = "1" ]]; then
echo -e "user ${user} already banned"
else
MYPIDUSER=$(cat /tmp/login_dropbear.txt | grep -w "$user" | awk {'print $1'} | sort -u)
echo -e "$user" >> "/etc/william/udp/listbanned-ssh.conf"
passwd -l $user 2>/dev/null
kill $MYPIDUSER
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="
<b>━━━━━━━━━━━━━━━━</b>
<b>MULTI LOGIN SSH</b>
<b>━━━━━━━━━━━━━━━━</b>
<b>Username: </b><code>$user</code>
<b>Domain: </b><code>$domain</code>
<b>Limit Login: </b><code>$ip_limit_ssh</code>
<b>Multi Login: </b><code>$cek_mulog_dropbear</code>
<b>Action: </b><code>BANNED</code>
<b>━━━━━━━━━━━━━━━━</b>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
fi
fi
done
#OPENSSH
data=( `ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'`);
cat $LOG | grep -i sshd | grep -i "Accepted password for" > /tmp/login-db.txt
for PID in "${data[@]}"
do
cat /tmp/login-db.txt | grep "sshd\[$PID\]" > /tmp/login-db-pid.txt;
NUM=`cat /tmp/login-db-pid.txt | wc -l`;
USER=`cat /tmp/login-db-pid.txt | awk '{print $9}'`;
IP=`cat /tmp/login-db-pid.txt | awk '{print $11}'`;
if [ $NUM -eq 1 ]; then
echo "$PID - $USER - $IP";
fi
done > /tmp/login_openssh.txt
MYUSER=$(cat /tmp/login_openssh.txt | awk {'print $3'} | tr -d "'" | sort -u)
for user in $MYUSER; do
ip_limit_ssh=$(cat /etc/william/limit-ssh/$user 2>/dev/null)
cek_mulog_openssh=$(cat /tmp/login_openssh.txt | grep -w "$user" | wc -l)
echo -e "======================="
echo -e "AUTOBAN MULTI LOGIN SSH"
echo -e "======================="
echo -e "user : $user"
echo -e "limit login : $ip_limit_ssh"
echo -e "ip login : $cek_mulog_openssh"
echo -e "======================="
echo ""
if [[ $cek_mulog_openssh -gt $ip_limit_ssh && $ip_limit_ssh -ne 0 ]]; then
ngecek_banned=$(cat /etc/william/udp/listbanned-ssh.conf | grep -w "$user" | wc -l)
if [[ "$ngecek_banned" = "1" ]]; then
echo -e "user ${user} already banned"
else
MYPIDUSER=$(cat /tmp/login_openssh.txt | grep -w "$user" | awk {'print $1'} | sort -u)
echo -e "$user" >> "/etc/william/udp/listbanned-ssh.conf"
passwd -l $user 2>/dev/null
kill $MYPIDUSER
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="
<b>━━━━━━━━━━━━━━━━</b>
<b>MULTI LOGIN SSH</b>
<b>━━━━━━━━━━━━━━━━</b>
<b>Username: </b><code>$user</code>
<b>Domain: </b><code>$domain</code>
<b>Limit Login: </b><code>$ip_limit_ssh</code>
<b>Multi Login: </b><code>$cek_mulog_openssh</code>
<b>Action: </b><code>BANNED</code>
<b>━━━━━━━━━━━━━━━━</b>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
fi
fi
done