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

Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[ON]${Font_color_suffix}"
Error="${Red_font_prefix}[OFF]${Font_color_suffix}"
cek=$(grep -c -E "^## BEGIN_Sendall" /etc/crontab)
if [[ "$cek" = "1" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
touch /home/chatid3
clear
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "  » Auto Send Trial Account Via Telegram Bot «"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e " Status Autosend Trial Via Bot Is $sts"
echo -e "   [1]  Auto Send Account"
echo -e "   [2]  Change Api Bot & Chat ID"
echo -e "   [3]  Stop Autosend Account"
echo -e "   [x]  Kembali Ke Menu"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e ""
read -p "   Select From Options [1-3 or x] :  " prot
echo -e ""
case $prot in
1)
ips=$(wget -qO- ipinfo.io/ip);
domain=$(cat /etc/xray/domain)
chatid=$(cat /home/chatid3 2>/dev/null)
apibot=$(cat /home/apibot3 2>/dev/null)
if [[ "$chatid" = "" ]]; then
echo "Please Enter Your Chat ID Group"
read -rp "Chat ID: " -e chatid
cat > "/home/chatid3" << EOF
$chatid
EOF
fi
if [[ "$apibot" = "" ]]; then
echo "Please Enter Your Api Bot"
echo "Get Api Bot From @BotFather"
echo "Dont Forget To Added Your Bot To Your Group"
read -rp "Api Bot: " -e apibot
cat > "/home/apibot3" << EOF
$apibot
EOF
fi
cek=$(grep -c -E "^## BEGIN_Sendall" /etc/crontab)
if [[ "$cek" = "0" ]]; then
echo "Want To Make Bot Will Auto Send Account ?"
echo "Account Will Be Send Automatically at 03:00 GMT +7 To Your Telegram Group"
read -p "Type Yes If Agree [yes/no]: " pilihan
	if [[ "$pilihan" = 'yes' ]]; then
cat << EOF >> /etc/crontab
## BEGIN_Sendall
0 3 * * * root auto-sendall
## END_Sendall
EOF
service cron restart
sleep 1
echo " Please Wait"
clear
echo " Autobackup Has Been Started"
echo " Account Will Be Send Automatically at 03:00 GMT +7"
else
echo "oke maybe next time..."
fi
auto-sendall
clear
echo "done, please cek your group telegram"
fi
;;
2)
FILE=/home/apibot3
if test -f "$FILE"; then
read -rp "Type Your New Api Bot: " -e apibot
cat > "/home/apibot3" << EOF
$apibot
EOF
read -rp "Type Your New Chat ID Group: " -e chatid
cat > "/home/chatid3" << EOF
$chatid
EOF
clear
echo "Succesfully Changed Api Bot & Chat ID Succesfully"
else
    echo "Api Bot & Chat ID Not Found, So Cannot To Change"
    exit 1
fi
service cron restart
;;
3)
sed -i "/^## BEGIN_Sendall/,/^## END_Sendall/d" /etc/crontab
clear
echo "Succesfully Stop AutoSend Account VPN"
service cron restart
;;
x)
clear
menu2
;;
*)
echo "Please enter an correct number"
;;
esac

