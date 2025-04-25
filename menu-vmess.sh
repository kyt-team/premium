#!/bin/bash
if [[ $(ulimit -c) != "0" ]]; then
  echo "Im Watching You..."
  echo "- @user_legend"
  exit 1
fi

red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear

echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e " ${red}                 ⇱ MENU VMESS WS ⇲               ${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "$green [•1] $NC Buat akun Vmess ws"
echo -e "$green [•2] $NC Hapus akun Vmess ws"
echo -e "$green [•3] $NC list akun Vmess ws"
echo -e "$green [•4] $NC Perpanjang Akun Vmess ws"
echo -e "$green [•5] $NC Aktivasi Limit IP LOGIN "
echo -e "$green [•6] $NC Change Limit IP LOGIN "
echo -e "$green [•7] $NC Unbanned Xray Account "
echo -e "$green [•8] $NC Check User Login Xray-TLS"
echo -e "$green [•9] $NC Check User Login Xray-NTLS"
echo -e "$green [•10] $NC Change Path Vmess WS"
echo -e "$green [•x] $NC Kembali Ke Menu [${green}x${NC}]"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e ""
read -p "   Select From Options [1-10 or x]: " menuvmessws
echo -e ""
case $menuvmessws in
1)
add-vmess
;;
2)
del-vmess
;;
3)
detail-vmess
;;
4)
renew-vmess
;;
5)
add-limit
;;
6)
change-limit
;;
7)
unban-xray
;;
8)
cek-tls
;;
9)
cek-ntls
;;
10)
path-vmess
;;
x)
clear
menu
;;
*)
echo " Please enter an correct number!!"
sleep 2
menu-vmess
;;
esac
