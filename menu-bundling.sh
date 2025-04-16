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
echo -e " ${red}                 ⇱ MENU BUNDLING ⇲               ${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "$green [•1] $NC Create Bundling Vmess (ws+grpc+tcp) [${green}bundling-vmess${NC}]"
echo -e "$green [•2] $NC Create Bundling Vless (ws+grpc+tcp) [${green}bundling-vless${NC}]"
echo -e "$green [•3] $NC Create Bundling Trojan (ws+grpc+tcp) [${green}bundling-tr${NC}]"
echo -e "$green [•x] $NC Kembali Ke Menu [${green}x${NC}]"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e ""
read -p "   Select From Options [1-3 or x]: " menubundling
echo -e ""
case $menubundling in
1)
bundling-vmess
;;
2)
bundling-vless
;;
3)
bundling-tr
;;
x)
clear
menu
;;
*)
echo " Please enter an correct number!!"
sleep 2
menu-bundling
;;
esac