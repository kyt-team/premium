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
echo -e " ${red}                  ⇱ MENU L2TP ⇲               ${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "$green [•1] $NC Create L2TP Account [${green}add-l2tp${NC}]"
echo -e "$green [•2] $NC Delete L2TP Account [${green}del-l2tp${NC}]"
echo -e "$green [•3] $NC Renew L2TP Account [${green}renew-l2tp${NC}]"
echo -e "$green [•x] $NC Kembali Ke Menu [${green}x${NC}]"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e ""
read -p "   Select From Options [1-3 or x]: " menul2tp
echo -e ""
case $menul2tp in
1)
add-l2tp
;;
2)
del-l2tp
;;
3)
renew-l2tp
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