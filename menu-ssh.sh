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
echo -e " ${red}               ⇱ MENU SSH,SLOWDNS & OVPN ⇲               ${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "$green [•1] $NC Create Ssh,Slowdns & Ovpn Account [${green}add-ssh${NC}]"
echo -e "$green [•2] $NC Create Ssh,Slowdns & Ovpn Account Trial [${green}trial-ssh${NC}]"
echo -e "$green [•3] $NC Delete Ssh,Slowdns & Ovpn Account [${green}hapus${NC}]"
echo -e "$green [•4] $NC Renew Ssh,Slowdns & Ovpn Account [${green}renew${NC}]"
echo -e "$green [•5] $NC Check User Login Ssh,Slowdns & Ovpn Account [${green}cek${NC}]"
echo -e "$green [•6] $NC List Account Ssh,Slowdns & Ovpn Account [${green}member${NC}]"
echo -e "$green [•7] $NC Set Up Autokill Multi Login [${green}autokill${NC}]"
echo -e "$green [•8] $NC Displays Users Who Do Multi Login [${green}ceklim${NC}]"
echo -e "$green [•9] $NC Activate Limit IP LOGIN [${green}add-limit${NC}]"
echo -e "$green [•10] $NC Change Limit IP LOGIN [${green}change-limit${NC}]"
echo -e "$green [•x] $NC Kembali Ke Menu [${green}x${NC}]"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e ""
read -p "   Select From Options [1-10 or x]: " menussh
echo -e ""
case $menussh in
1)
add-ssh
;;
2)
trial-ssh
;;
3)
hapus
;;
4)
renew
;;
5)
cek
;;
6)
member
;;
7)
autokill
;;
8)
ceklim
;;
9)
add-limit
;;
10)
change-limit
;;
x)
clear
menu
;;
*)
echo " Please enter an correct number!!"
sleep 2
menu-ssh
;;
esac