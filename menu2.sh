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
ipsaya=$(wget -qO- ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/kyt-team/regip/main/ip"
checking_sc() {
  useexp=$(wget -qO- $data_ip | grep $ipsaya | awk '{print $3}')
  if [[ $date_list < $useexp ]]; then
    echo -ne
  else
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "            ${RED}PERMISSION DENIED !${NC}"
    echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
    echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
    echo -e "             \033[0;33mContact Admin :${NC}"
    echo -e "      \033[0;36mTelegram${NC} t.me/Alvi_cell"
    echo -e "      ${GREEN}WhatsApp${NC} wa.me/6282183496832"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    exit
  fi
}
checking_sc
clear

ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/kyt-team/regip/main/ip | grep $MYIP | awk '{print $2}')
if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
else
Exp=$(curl -sS https://raw.githubusercontent.com/kyt-team/regip/main/ip | grep $MYIP | awk '{print $3}')
fi



UDPX="https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2"
# // Exporting Language to UTF-8
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export LC_CTYPE='en_US.utf8'
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
# Warna
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'
COLOR1='\033[0;36m'
    # Validasi format ExpRaw = YYYY-MM-DD
    if date -d "$ExpRaw" "+%Y-%m-%d" >/dev/null 2>&1; then
        Exp="${YELLOW}$ExpRaw${NC}"
        now_date=$(date +%Y-%m-%d)
        d1=$(date -d "$ExpRaw" +%s)
        d2=$(date -d "$now_date" +%s)
        selisih=$(( (d1 - d2) / 86400 ))
# Header Box
echo -e "${COLOR1}╔══════════════════════════════════════════════════════╗${NC}"
echo -e "${COLOR1}║${NC}                  \e[1;35m<< ALVI TUNNEL >>\e[0m                   ${COLOR1}║${NC}"
echo -e "${COLOR1}╚══════════════════════════════════════════════════════╝${NC}"

# Informasi VPS
echo -e "  ${BLUE}• ${GREEN}Server Uptime       ${NC}= $(uptime -p | cut -d ' ' -f 2-10000)"
echo -e "  ${BLUE}• ${GREEN}Operating System    ${NC}= $(grep -w PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '\"')( $(uname -m) )"
echo -e "  ${BLUE}• ${GREEN}Domain              ${NC}= $(cat /etc/xray/domain)"
echo -e "  ${BLUE}• ${GREEN}Server IP           ${NC}= ${ipsaya}"
echo -e "  ${BLUE}• ${GREEN}ISP-VPS             ${NC}= ${ISP}"
echo -e "  ${BLUE}• ${GREEN}City                ${NC}= ${CITY}"
echo -e "  ${BLUE}• ${GREEN}Clients Name        ${NC}= ${YELLOW}${Name}${NC}"
echo -e "  ${BLUE}• ${GREEN}Script Expired      ${NC}= ${YELLOW}${Exp}${NC} ${RED}(${selisih} Days)${NC}"
echo -e "${BLUE} ${NC}"
# Menu Utama
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━ MENU UTAMA ━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}[1]${NC} 🌐 MENU SSH        ${GREEN}[2]${NC} ⚡ MENU VMESS"
echo -e "${GREEN}[3]${NC} 💎 MENU VLESS      ${GREEN}[4]${NC} 🔐 MENU TROJAN"
echo -e "${GREEN}[5]${NC} ⚙️  MENU SETTING    ${GREEN}[6]${NC} 📖 MENU INFORMASI"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

echo -e   ""
echo -e "[CTRL + C] For Exit From Main Menu"
echo -e   ""
read -p "Select From Options [1-6 or x] :  " menu
echo -e ""
case $menu in
1)
menu-ssh
;;
2)
menu-vmess
;;
3)
menu-vless
;;
4)
menu-trws
;;
5)
menu-setting
;;
6)
menu3
;;
x)
clear
menu
;;
*)
echo " Please Choose Number !"
sleep 2 
menu
;;
esac
