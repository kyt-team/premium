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
echo -e " ${red}                 ⇱ MENU VLESS WS ⇲               ${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "$green [•1] $NC Create Vless WS Account [${green}add-vless${NC}]"
echo -e "$green [•2] $NC Delete Vless WS Account [${green}del-vless${NC}]"
echo -e "$green [•3] $NC Detail Vless WS Account [${green}detail-vless${NC}]"
echo -e "$green [•4] $NC Renew Vless WS Account [${green}renew-vless${NC}]"
echo -e "$green [•5] $NC Activate Limit IP LOGIN [${green}add-limit${NC}]"
echo -e "$green [•6] $NC Change Limit IP LOGIN [${green}change-limit${NC}]"
echo -e "$green [•7] $NC Unbanned Xray Account [${green}unban-xray${NC}]"
echo -e "$green [•8] $NC Check User Login Xray-TLS [${green}cek-tls${NC}]"
echo -e "$green [•9] $NC Check User Login Xray-NTLS [${green}cek-ntls${NC}]"
echo -e "$green [•10] $NC Change Path Vless WS [${green}path-vless${NC}]"
echo -e "$green [•x] $NC Kembali Ke Menu [${green}x${NC}]"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e ""
read -p "   Select From Options [1-10 or x]: " menuvless
echo -e ""
case $menuvless in
1)
add-vless
;;
2)
del-vless
;;
3)
detail-vless
;;
4)
renew-vless
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
path-vless
;;
x)
clear
menu
;;
*)
echo " Please enter an correct number!!"
sleep 2
menu-vless
;;
esac