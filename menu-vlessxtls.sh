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
echo -e " ${red}                  ⇱ MENU VLESS XTLS ⇲               ${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "$green [•1] $NC Create Vless XTLS Account [${green}add-vlessxtls${NC}]"
echo -e "$green [•2] $NC Delete Vless XTLS Account [${green}del-vlessxtls${NC}]"
echo -e "$green [•3] $NC Detail Vless XTLS Account [${green}detail-vlessxtls${NC}]"
echo -e "$green [•4] $NC Renew Vless XTLS Account [${green}renew-vlessxtls${NC}]"
echo -e "$green [•5] $NC Check User Login Xray-TLS [${green}cek-tls${NC}]"
echo -e "$green [•6] $NC Check User Login Xray-NTLS [${green}cek-ntls${NC}]"
echo -e "$green [•x] $NC Kembali Ke Menu [${green}x${NC}]"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e ""
read -p "   Select From Options [1-6 or x]: " menuvlessxtls
echo -e ""
case $menuvlessxtls in
1)
add-vlessxtls
;;
2)
del-vlessxtls
;;
3)
detail-vlessxtls
;;
4)
renew-vlessxtls
;;
5)
cek-tls
;;
6)
cek-ntls
;;
x)
clear
menu
;;
*)
echo " Please enter an correct number!!"
sleep 2
menu-vlessxtls
;;
esac