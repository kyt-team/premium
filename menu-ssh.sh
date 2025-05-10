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
echo -e "$green [•1] $NC Buat akun Ssh,Slowdns & Ovpn Account"
echo -e "$green [•2] $NC Trial  Ssh,Slowdns & Ovpn Account Trial"
echo -e "$green [•3] $NC Hapus Akun Ssh,Slowdns & Ovpn Account"
echo -e "$green [•4] $NC Perpanjang Akun Ssh,Slowdns & Ovpn Account "
echo -e "$green [•5] $NC Check User Login Ssh,Slowdns & Ovpn Account"
echo -e "$green [•6] $NC List Akun Ssh,Slowdns & Ovpn Account "
echo -e "$green [•7] $NC Set Up Autokill Multi Login"
echo -e "$green [•8] $NC Displays Users Who Do Multi Login"
echo -e "$green [•9] $NC Aktivasi Limit IP LOGIN"
echo -e "$green [•10] $NC Ganti Limit IP LOGIN"
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
