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
echo -e " ${red}                 ⇱ MENU IKEv2 ⇲               ${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "$green [•1] $NC Create IKEv2 Account [${green}add-ikev2${NC}]"
echo -e "$green [•2] $NC Delete IKEv2 Account [${green}del-ikev2${NC}]"
echo -e "$green [•3] $NC Cek User Login IKEv2 Account [${green}cek-ikev2${NC}]"
echo -e "$green [•4] $NC Renew IKEv2 Account [${green}renew-ikev2${NC}]"
echo -e "$green [•x] $NC Kembali Ke Menu [${green}x${NC}]"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e ""
read -p "   Select From Options [1-4 or x]: " menuikev2
echo -e ""
case $menuikev2 in
1)
add-ikev2
;;
2)
del-ikev2
;;
3)
cek-ikev2
;;
4)
renew-ikev2
;;
x)
clear
menu
;;
*)
echo " Please enter an correct number!!"
sleep 2
menu-l2tp
;;
esac