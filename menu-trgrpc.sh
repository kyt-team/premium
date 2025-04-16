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
echo -e " ${red}                 ⇱ MENU TROJAN GRPC ⇲               ${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "$green [•1] $NC Create Trojan Grpc Account [${green}add-trgrpc${NC}]"
echo -e "$green [•2] $NC Delete Trojan Grpc Account [${green}del-trgrpc${NC}]"
echo -e "$green [•3] $NC Detail Trojan Grpc Account [${green}detail-trgrpc${NC}]"
echo -e "$green [•4] $NC Renew Trojan Grpc Account [${green}renew-trgrpc${NC}]"
echo -e "$green [•5] $NC Check User Login Xray-TLS [${green}cek-tls${NC}]"
echo -e "$green [•6] $NC Check User Login Xray-NTLS [${green}cek-ntls${NC}]"
echo -e "$green [•7] $NC Check Quota Usage Xray-TLS [${green}traffic-xraytls${NC}]"
echo -e "$green [•8] $NC Check Quota Usage Xray-NTLS [${green}traffic-xrayntls${NC}]"
echo -e "$green [•9] $NC Change Path Trojan GRPC [${green}path-trgrpc${NC}]"
echo -e "$green [•x] $NC Kembali Ke Menu [${green}x${NC}]"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e ""
read -p "   Select From Options [1-9 or x]: " menutrojangrpc
echo -e ""
case $menutrojangrpc in
1)
add-trgrpc
;;
2)
del-trgrpc
;;
3)
detail-trgrpc
;;
4)
renew-trgrpc
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
path-trgrpc
;;
x)
clear
menu
;;
*)
echo " Please enter an correct number!!"
sleep 2
menu-trojangrpc
;;
esac