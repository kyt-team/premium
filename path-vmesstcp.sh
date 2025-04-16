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

old=$(cat /etc/xray/path/vmess_tcp_path)
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e " ${red}             ⇱ CHANGE PATH Vmess TCP ⇲               ${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${green}ENGLISH${NC} :"
echo -e "Please Enter Path Starting With /"
echo -e "${red}WARNING !${NC} : Change The Path Will Make Your Previous Path Not Working"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e "${green}INDONESIA${NC} :"
echo -e "Masukin Path Diawali Dengan /"
echo -e "${red}PERINGATAN !${NC} : Mengubah Path Akan Mengakibatkan Path Sebelumnya Tidak Berfungsi"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Your Current Path : $old"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo -e "Please Enter A New Path For Vmess TCP"
read -p "New Path : " new
if [ -z $new ]; then
echo "Tolong Masukin Path Dengan Benar"
exit 0
fi
validChars="/"
if [[ $new != *["$validChars"]* ]]; then
    echo "Tolong Masukin Path Diawali Dengan /"
    echo "Please Enter Path Starting With /"
    exit 0
fi
cek="/vmess"
if [ "$new" = "$cek" ]; then
echo "tolong gunakan nama lain"
echo "please use another name"
exit 0
fi
validasipath=$(grep -rw "/usr/local/etc/xray/will666.json" -e "$new" | sed 's/^ *//g' | tr -d ',' | sort -u | sed 's/"path"://g' | sed 's/^ *//g' | tr -d '"' | tail -n 1)
if [ "$new" == "$validasipath" ]; then
echo "path sudah digunakan"
echo "path already used"
exit 0
fi
sed -i "s#${old}#${new}#g" /usr/local/etc/xray/config.json
sed -i "s#${old}#${new}#g" /usr/local/etc/xray/will666.json
sed -i "s#${old}#${new}#g" /etc/xray/path/vmess_tcp_path
echo -e ""
echo -e "Change Path Successfully !"
echo -e "Your Path Now Is $new"
sleep 1
echo "restart service xray..."
sleep 1
systemctl restart xray
systemctl restart will666
echo "DONE !"
sleep 2
clear