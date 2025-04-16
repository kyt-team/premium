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
echo -e " ${red}                ⇱ MENU VLESS GRPC ⇲               ${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "$green [•1] $NC Create Vless Grpc Account [${green}add-vlessgrpc${NC}]"
echo -e "$green [•2] $NC Delete Vless Grpc Account [${green}del-vlessgrpc${NC}]"
echo -e "$green [•3] $NC Detail Vless Grpc Account [${green}detail-vlessgrpc${NC}]"
echo -e "$green [•4] $NC Renew Vless Grpc Account [${green}renew-vlessgrpc${NC}]"
echo -e "$green [•5] $NC Check User Login Xray-TLS [${green}cek-tls${NC}]"
echo -e "$green [•6] $NC Check User Login Xray-NTLS [${green}cek-ntls${NC}]"
echo -e "$green [•7] $NC Check Quota Usage Xray-TLS [${green}traffic-xraytls${NC}]"
echo -e "$green [•8] $NC Check Quota Usage Xray-NTLS [${green}traffic-xrayntls${NC}]"
echo -e "$green [•9] $NC Change Path Vless GRPC [${green}path-vlessgrpc${NC}]"
echo -e "$green [•x] $NC Kembali Ke Menu [${green}x${NC}]"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e ""
read -p "   Select From Options [1-9 or x]: " menuvlessgrpc
echo -e ""
case $menuvlessgrpc in
1)
add-vlessgrpc
;;
2)
del-vlessgrpc
;;
3)
detail-vlessgrpc
;;
4)
renew-vlessgrpc
;;
5)
cek-tls
;;
6)
cek-ntls
;;
7)
traffic-xraytls
;;
8)
traffic-xrayntls
;;
9)
path-vlessgrpc
;;
x)
clear
menu
;;
*)
echo " Please enter an correct number!!"
sleep 2
menu-vlessgrpc
;;
esac