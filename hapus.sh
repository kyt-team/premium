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

echo "------------------------------------------------------------"
echo "USERNAME          PASSWORD          EXP DATE          STATUS"
echo "------------------------------------------------------------"
while read expired
do
  AKUN="$(echo $expired | cut -d: -f1)"
  ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
  exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
  status="$(passwd -S $AKUN | awk '{print $2}' )"
  password="$(grep -w "^$AKUN" /etc/william/udp/udp.conf | cut -d ">" -f2)"
  if [[ $ID -ge 1000 ]]; then
    if [[ "$status" = "L" ]]; then
      printf "%-17s %-17s %-17s %2s \n" "$AKUN" "$password" "$exp     " "LOCKED"
    else
      printf "%-17s %-17s %-17s %2s \n" "$AKUN" "$password" "$exp     " "UNLOCKED"
    fi
  fi
done < /etc/passwd

JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo "------------------------------------------------------------"
echo "Account number: $JUMLAH user"
echo "------------------------------------------------------------"
echo ""
read -p "Username SSH to Delete : " Pengguna

if getent passwd ${Pengguna} > /dev/null 2>&1; then
userdel -f ${Pengguna}
sed -i "/${Pengguna} >/d" /etc/william/udp/udp.conf
sed -i "/${Pengguna}/d" /etc/william/udp/listbanned-ssh.conf
echo -e "User ${Pengguna} was removed."
else
echo -e "Failure: User ${Pengguna} Not Exist."
fi
systemctl restart udp-custom