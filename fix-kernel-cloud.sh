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

source /etc/os-release
OS=$ID
if [[ $OS == 'debian' ]]; then
oldkernel=$(uname -r)
check=$(uname -ar | cut -d " " -f 3-3 | cut -d'-' -f3)
if [[ "$check" == "cloud" ]]; then
echo -e "${green}scanning....${NC}"
sleep 2
echo -e "${green}we detected ${red}cloud ${NC}${green}from your kernel${green}"
sleep 2
echo -e "${green}start to remove cloud kernel....${NC}"
sleep 1
echo -e "${green}choose <No> for next notifcation${NC}"
sleep 3
# Menghapus kernel cloud yang ada
echo "Menghapus kernel cloud yang ada..."
listkernelcloud=$(dpkg --list | grep linux-image | grep cloud | awk {'print $2'})
for kernel in "${listkernelcloud[@]}"
do
apt-get -y purge $kernel
done

# Memasang kernel versi baru yang diinginkan
echo "Memasang kernel versi baru..."
apt-get -y update
apt-get -y install linux-image-amd64

# Mengubah bootloader ke kernel baru
echo "Mengubah bootloader..."
sed -i "s/GRUB_DISABLE_OS_PROBER=true/GRUB_DISABLE_OS_PROBER=false/g" /etc/default/grub
update-grub

# Restart sistem
echo "Change Kernel Sukses !"
sleep 3
echo "Me-restart sistem..."
reboot
else
clear
echo "cloud kernel not found"
fi
else
echo "this script for debian 9/10 only !"
fi