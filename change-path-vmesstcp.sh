#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'

old=$(cat /etc/xray/path/vmess_tcp_path)
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${red}             ⇱ CHANGE PATH Vmess TCP ⇲               ${NC}"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "${green}ENGLISH${NC} :"
echo -e "Please Enter Path Starting With /"
echo -e "${red}WARNING !${NC} : Change The Path Will Make Your Previous Path Not Working"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e "${green}INDONESIA${NC} :"
echo -e "Masukin Path Diawali Dengan /"
echo -e "${red}PERINGATAN !${NC} : Mengubah Path Akan Mengakibatkan Path Sebelumnya Tidak Berfungsi"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Your Path Is : $old"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo -e "Please Enter A New Path For Vmess TCP"
read -p "New Path : " new
if [ -z $new ]; then
echo "Tolong Masukin Path Dengan Benar"
exit 0
fi
validChars="/"
if [[ $new != *["$validChars"]* ]]; then
    echo "Tolong Masukin Path Diawali Dengan /"
    echo "Please Enter Path Starting With /"
    exit 0
fi
cek="/vmess"
if [ "$new" = "$cek" ]; then
echo "tolong gunakan nama lain"
echo "please use another name"
exit 0
fi
validasipath=$(grep -rw "/usr/local/etc/xray/config.json" -e "$new" | sed 's/^ *//g' | tr -d ',' | sort -u | sed 's/"path"://g' | sed 's/^ *//g' | tr -d '"' | tail -n 1)
if [ "$new" == "$validasipath" ]; then
echo "path sudah digunakan"
echo "path already used"
exit 0
fi
sed -i "s#${old}#${new}#g" /usr/local/etc/xray/config.json
sed -i "s#${old}#${new}#g" /etc/xray/path/vmess_tcp_path
echo -e ""
echo -e "Change Path Successfully !"
echo -e "Your Path Now Is $new"
sleep 1
echo "restart service xray..."
sleep 1
systemctl restart xray
echo "DONE !"
sleep 2
clear