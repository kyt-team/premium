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
cek=$(grep -c -E "^## BEGIN_Backup" /etc/crontab)
if [[ "$cek" = "1" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
clear
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "   » Backup Data Via Telegram Bot «"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e " Status Autobackup Data Via Bot Is $sts"
echo -e "   [1]  Start Backup Data"
echo -e "   [2]  Change Api Bot & Chat ID"
echo -e "   [3]  Change Backup Time"
echo -e "   [4]  Stop Autobackup Data"
echo -e "   [x]  Kembali Ke Menu"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e ""
read -p "   Select From Options [1-4 or x] :  " prot
echo -e ""
case $prot in
1)
ips=$(curl -sS ipinfo.io/ip);
domain=$( cat /etc/xray/domain )
chatid=$(cat /home/chatid)
apibot=$(cat /home/apibot)
if [[ "$chatid" = "" ]]; then
echo -e "Please Enter Your Chat ID Group"
read -rp "Chat ID: " -e chatid
cat <<EOF>>/home/chatid
$chatid
EOF
fi
if [[ "$apibot" = "" ]]; then
echo -e "Please Enter Your Api Bot"
echo -e "Get Api Bot In @BotFather"
echo -e "Dont Forget To Added Your Bot To Your Group"
read -rp "Api Bot: " -e apibot
cat <<EOF>>/home/apibot
$apibot
EOF
fi
cek=$(grep -c -E "^## BEGIN_Backup" /etc/crontab)
if [[ "$cek" = "0" ]]; then
echo -e "AutoBackup DATA 00:05 GMT +7 To Your Telegram"
cat << EOF >> /etc/crontab
## BEGIN_Backup
5 0 * * * root bckp-bot
## END_Backup
EOF
service cron restart
sleep 1
echo -e "Please Wait"
clear
rm -rf /home/vps/public_html/restore/
ips=$(curl -sS ipinfo.io/ip);
domain=$( cat /etc/v2ray/domain )
chatid=$(cat /home/chatid)
apibot=$(cat /home/apibot)
date=$(date +"%Y-%m-%d" | cut -d "-" -f 2-3);
date2=$(date +"%Y-%m-%d");
time=$(date +"%H:%M:%S" | cut -d ":" -f 1-2);
rm -f $ips-$date-$time.zip
rm -rf /root/backup
mkdir /root/backup
cd /root
cp /root/log-install.txt /root/backup/
cp /etc/passwd /root/backup
cp /etc/group /root/backup
cp /etc/shadow /root/backup
cp /etc/gshadow /root/backup
cp /etc/ppp/chap-secrets backup/chap-secrets
cp /etc/ipsec.secrets backup/ipsec.secrets
cp /etc/ipsec.d/passwd backup/passwd1
cp /usr/local/etc/xray/config.json backup/
cp /usr/local/etc/xray/none.json backup/
cp /usr/local/etc/xray/will69.json backup/
cp /usr/local/etc/xray/will666.json backup/
cp /etc/systemd/system/cdn.service backup/
cp -r /var/lib/premium-script/ backup/premium-script
cp -r /etc/william/ backup/william
cp -r /etc/william/slowdns backup/slowdns
cp -r /etc/ssl/private/ backup/private
cp -r /home/vps/public_html backup/public_html
cp -r /etc/xray/ backup/xray/
cp -r /etc/v2ray/ backup/v2ray/
cp -r /etc/nginx/conf.d/ backup/conf.d/
cd /root
zip -r $ips-backup-data.zip backup > /dev/null 2>&1
curl -F chat_id="$chatid" -F document=@"$ips-backup-data.zip" -F caption="
Thank You For Using Our Service
━━━━━━━━━━━━━━━━━━━
Tanggal Backup : $date2
━━━━━━━━━━━━━━━━━━━
Your Domain : $domain
Your IP VPS  : $ips
━━━━━━━━━━━━━━━━━━━
Cara Restore ?
1. Forward File Ini Ke Bot Direct Link/Mirror Link @direct_link69_bot
2. Copy hasil restore ke menu restore di script william

Note: Mohon Dibaca
- Jangan Lupa Mengaktifkan Auto backup Bot Telegram Agar Data Selalu TerUpdate
- Gunakan Juga Backup Via Gmail Jika VPS Tidak Memblockir Port SMTP
- Password VPS Akan Mengikuti Dari Data Yang Di Restore
━━━━━━━━━━━━━━━━━━━" https://api.telegram.org/bot$apibot/sendDocument
rm -rf $ips-backup-data.zip
clear
echo -e "done, please cek your group telegram"
else
echo -e "AutoBackup Data Already Active"
exit
fi
;;
2)
FILE=/home/apibot
if test -f "$FILE"; then
read -rp "Type Your New Api Bot: " -e apibot
cat > "/home/apibot" << EOF
$apibot
EOF
read -rp "Type Your New Chat ID Group: " -e chatid
cat > "/home/chatid" << EOF
$chatid
EOF
clear
echo -e "Succesfully Changed Api Bot & Chat ID Succesfully"
else
    echo -e "Api Bot & Chat ID Not Found, So Cannot To Change"
    exit 1
fi
;;
3)
    cekwaktu=$(grep -c -E "^## BEGIN_Backup" /etc/crontab)
    if [[ "$cekwaktu" = "0" ]]; then
        echo -e "Start Backup Data And Choose Yes First !"
        exit 1
    fi
    Current_Time=$(cat /etc/crontab | grep -w "bckp-bot" | sed 's/root bckp-bot//g' | sed '${s/ *$//}')
    if [[ "$Current_Time" = "5 0 * * *" ]]; then
        Current_TimeX="Every 1 Days at 00.05 am"
    fi
    if [[ "$Current_Time" = "0 * * * *" ]]; then
        Current_TimeX="Every 1 Hour"
    fi
    if [[ "$Current_Time" = "0 */3 * * *" ]]; then
        Current_TimeX="Every 3 Hour"
    fi
    if [[ "$Current_Time" = "0 */5 * * *" ]]; then
        Current_TimeX="Every 5 Hour"
    fi
echo -e "What Time Do You Want To Backup Data?"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e " Current Backup Time : ${green}$Current_TimeX${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "  [1] Every 1 Hour"
echo -e "  [2] Every 3 Hour"
echo -e "  [3] Every 5 Hour"
echo -e "  [4] Every 1 Days at 00.05 am"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
read -rp "  Select From Options [1-4]:  " -e waktu
echo -e ""
if [[ "$waktu" = "1" ]]; then
    if [[ "$Current_Time" = "0 * * * *" ]]; then
    echo -e "Already Used, Please Choose Another one !"
    exit 1
    fi
    sed -i "/## BEGIN_Backup/,/## END_Backup/d" /etc/crontab
    cat << EOF >> /etc/crontab
## BEGIN_Backup
0 * * * * root bckp-bot
## END_Backup
EOF
    service cron restart
    clear
    echo -e " Succesfully Change Time To ${green}Backup Every 1 Hour${NC}"
elif [[ "$waktu" = "2" ]]; then
    if [[ "$Current_Time" = "0 */3 * * *" ]]; then
    echo -e "Already Used, Please Choose Another one !"
    exit 1
    fi
    sed -i "/## BEGIN_Backup/,/## END_Backup/d" /etc/crontab
    cat << EOF >> /etc/crontab
## BEGIN_Backup
0 */3 * * * root bckp-bot
## END_Backup
EOF
    service cron restart
    clear
    echo -e " Succesfully Change Time Backup To ${green}Every 3 Hour${NC}"
elif [[ "$waktu" = "3" ]]; then
    if [[ "$Current_Time" = "0 */5 * * *" ]]; then
    echo -e "Already Used, Please Choose Another one !"
    exit 1
    fi
    sed -i "/## BEGIN_Backup/,/## END_Backup/d" /etc/crontab
    cat << EOF >> /etc/crontab
## BEGIN_Backup
0 */5 * * * root bckp-bot
## END_Backup
EOF
    service cron restart
    clear
    echo -e " Succesfully Change Time Backup To ${green}Every 5 Hour${NC}"
elif [[ "$waktu" = "4" ]]; then
    if [[ "$Current_Time" = "5 0 * * *" ]]; then
    echo -e "Already Used, Please Choose Another one !"
    exit 1
    fi
    sed -i "/## BEGIN_Backup/,/## END_Backup/d" /etc/crontab
    cat << EOF >> /etc/crontab
## BEGIN_Backup
5 0 * * * root bckp-bot
## END_Backup
EOF
    service cron restart
    clear
    echo -e " Succesfully Change Time Backup To ${green}Every 1 Days at 00.05 am${NC}"
else
    clear
    echo -e " You Entered The Wrong Number"
fi
;;
4)
sed -i "/^## BEGIN_Backup/,/^## END_Backup/d" /etc/crontab
clear
echo -e "Succesfully Stop Autobackup Data"
;;
x)
clear
menu
;;
*)
echo -e "Please enter an correct number"
;;
esac

