#!/bin/bash
if [[ $(ulimit -c) != "0" ]]; then
  echo "Im Watching You..."
  echo "- @user_legend"
  exit 1
fi

red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
IP=$(curl -sS ipinfo.io/ip > /tmp/ipaddress.txt)
MYIP=$(cat /tmp/ipaddress.txt)

# cek wget & curl
if ! which wget > /dev/null; then
clear
echo -e "${red}Wah Mau Belajar Nakal Yah !${NC}"
sleep 2
exit 0
clear
else
echo "Wget is already installed"
fi

if ! which curl > /dev/null; then
clear
echo -e "${red}Wah Mau Belajar Nakal Yah !${NC}"
sleep 2
exit 0
clear
else
echo "curl is already installed"
fi

fileee=/usr/bin/wget
minimumsize=400000
actualsize=$(wc -c <"$fileee")
if [ $actualsize -ge $minimumsize ]; then
clear
echo -e "${green}Checking...${NC}"
else
clear
echo -e "${red}Permission Denied!${NC}";
echo "Reason : Modified Package To Bypass Sc"
exit 0
fi

fileeex=/usr/bin/curl
minimumsizex=15000
clear
actualsizex=$(wc -c <"$fileeex")
if [ $actualsizex -ge $minimumsizex ]; then
clear
echo -e "${green}Checking...${NC}"
else
clear
echo -e "${red}Permission Denied!${NC}";
echo "Reason : Modified Package To Bypass Sc"
exit 0
fi


# data server
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
cekcloudflare=$(curl -sS http://ip-api.com/json | jq .as | grep -o "Cloudflare")
if [[ "$cekcloudflare" = "Cloudflare" ]]; then
cekdomen=$(cat /etc/xray/domain)
MYIP=$(dig +short "$cekdomen" | head -n 1)
fi
repogithub='kyt-team/premium/main'
clear

echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "    CHANGE UUID OR PASSWORD XRAY"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e " [1]  CHANGE UUID/PASS FOR VMESS WS"
echo -e " [2]  CHANGE UUID/PASS FOR VLESS WS"
echo -e " [3]  CHANGE UUID/PASS FOR TROJAN WS"
echo -e "----------------------------------"
echo -e " [4]  CHANGE UUID/PASS FOR VMESS GRPC"
echo -e " [5]  CHANGE UUID/PASS FOR VLESS GRPC"
echo -e " [6]  CHANGE UUID/PASS FOR TROJAN GRPC"
echo -e "----------------------------------"
echo -e " [7]  CHANGE UUID/PASS FOR VMESS TCP HTTP"
echo -e " [8]  CHANGE UUID/PASS FOR VLESS TCP XTLS"
echo -e " [9]  CHANGE UUID/PASS FOR TROJAN TCP"
echo -e "----------------------------------"
echo -e " [x]  Back To Menu"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e ""
read -p "  Select From Options [1-9 or x] :  " prot
echo -e ""
case $prot in
1)
protocol1=$(grep -E -w "VmessWS-TLS" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4-4 | head -1)
protocol2=$(grep -E -w "VmessWS-NTLS" "/usr/local/etc/xray/none.json" | cut -d ' ' -f 4-4 | head -1)
if [[ $protocol1 = "VmessWS-TLS" ]]; then
NUMBER_OF_CLIENTS=$(grep -c -E "$protocol1 " "/usr/local/etc/xray/config.json")
        if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
                echo ""
                echo "You have no existing clients !"
                exit 1
        fi
        echo ""
        echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo " Custom Change UUID VMESS WS"
        echo " Press CTRL+C to return"
        echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo "     No User  Expired  Protocol"
        grep -E "$protocol1 " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-4 | nl -s ') '
        until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
                if [[ ${CLIENT_NUMBER} == '1' ]]; then
                        echo ""
                        read -rp "Select one client [1]: " CLIENT_NUMBER
                else
                        echo ""
                        read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
                fi
        done
user=$(grep -E "$protocol1" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
uuidold=$(cat /usr/local/etc/xray/config.json | grep -w "$user" | awk {'print $2'} | tail -n 1 | tr -d '"' | sed 's/level://g' | tr -d ',')
echo ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Kamu Memilih User : $user"
echo "Current UUID : $uuidold"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
read -p "Please enter the new UUID (leave it blank for a random UUID): " uuidnew
if [ -z "$uuidnew" ]; then
  uuidnew=$(cat /proc/sys/kernel/random/uuid)
fi
if [[ $uuidnew =~ ^\{?[A-F0-9a-f]{8}-[A-F0-9a-f]{4}-[A-F0-9a-f]{4}-[A-F0-9a-f]{4}-[A-F0-9a-f]{12}\}?$ ]]; then
  echo -e "${green}uuid valid${NC}"
else
  echo -e "${red}uuid tidak valid${NC}"
  exit 0
fi
validasiuuid=$(grep -rw "/usr/local/etc/xray/config.json" -e "$uuidnew" | awk {'print $2'} | sed 's/"level"://g' | tr -d '"' | tr -d ',' | sort -u)
if [ "$uuidnew" == "$validasiuuid" ]; then
  echo -e "${red}uuid sudah digunakan${NC}"
  echo -e "${red}uuid already used${NC}"
  exit 0
fi
sed -i "s#${uuidold}#${uuidnew}#g" /usr/local/etc/xray/config.json
sed -i "s#${uuidold}#${uuidnew}#g" /usr/local/etc/xray/none.json
clear
systemctl restart xray
systemctl restart xray@none
echo ""
clear
echo -e "${green}CHANGE UUID SUCCESS !${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Protocol : Vmess WS"
echo "Username : $user"
echo "New UUID : $uuidnew"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
else
echo "no user found for vmess ws"
exit 0
fi
;;
2)
protocol1=$(grep -E -w "VlessWS-TLS" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4-4 | head -1)
protocol2=$(grep -E -w "VlessWS-NTLS" "/usr/local/etc/xray/none.json" | cut -d ' ' -f 4-4 | head -1)
if [[ $protocol1 = "VlessWS-TLS" ]]; then
NUMBER_OF_CLIENTS=$(grep -c -E "$protocol1 " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi
	echo ""
	echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	echo " Custom Change UUID VLESS WS"
	echo " Press CTRL+C to return"
	echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	echo "     No User  Expired  Protocol"
	grep -E -w "$protocol1 " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-4 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
            echo ""
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
            echo ""
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
user=$(grep -E -w "$protocol1" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
uuidold=$(cat /usr/local/etc/xray/config.json | grep -w "$user" | awk {'print $2'} | tail -n 1 | tr -d '"' | sed 's/level://g' | tr -d ',')
echo ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Kamu Memilih User : $user"
echo "Current UUID : $uuidold"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
read -p "Please enter the new UUID (leave it blank for a random UUID): " uuidnew
if [ -z "$uuidnew" ]; then
  uuidnew=$(cat /proc/sys/kernel/random/uuid)
fi
if [[ $uuidnew =~ ^\{?[A-F0-9a-f]{8}-[A-F0-9a-f]{4}-[A-F0-9a-f]{4}-[A-F0-9a-f]{4}-[A-F0-9a-f]{12}\}?$ ]]; then
  echo -e "${green}uuid valid${NC}"
else
  echo -e "${red}uuid tidak valid${NC}"
  exit 0
fi
validasiuuid=$(grep -rw "/usr/local/etc/xray/config.json" -e "$uuidnew" | awk {'print $2'} | sed 's/"level"://g' | tr -d '"' | tr -d ',' | sort -u)
if [ "$uuidnew" == "$validasiuuid" ]; then
  echo -e "${red}uuid sudah digunakan${NC}"
  echo -e "${red}uuid already used${NC}"
  exit 0
fi
sed -i "s#${uuidold}#${uuidnew}#g" /usr/local/etc/xray/config.json
sed -i "s#${uuidold}#${uuidnew}#g" /usr/local/etc/xray/none.json
clear
systemctl restart xray
systemctl restart xray@none
clear
echo ""
echo -e "${green}CHANGE UUID SUCCESS !${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Protocol : Vless WS"
echo "Username : $user"
echo "New UUID : $uuidnew"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
else
echo "no user found for vless ws"
exit 0
fi
;;
3)
protocol=$(grep -E "TrojanWS" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4-4 | head -1)
if [[ $protocol = "TrojanWS" ]]; then
NUMBER_OF_CLIENTS=$(grep -c -E "$protocol " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi
	echo ""
	echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	echo " Custom Change UUID TROJAN WS"
	echo " Press CTRL+C to return"
	echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	echo "     No User  Expired  Protocol"
	grep -E "$protocol " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-4 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
            echo ""
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
            echo ""
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
user=$(grep -E "$protocol" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
uuidold=$(cat /usr/local/etc/xray/config.json | grep -w "$user" | awk {'print $2'} | tail -n 1 | tr -d '"' | sed 's/level://g' | tr -d ',')
echo ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Kamu Memilih User : $user"
echo "Current UUID : $uuidold"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
read -p "Please enter the new UUID (leave it blank for a random UUID): " uuidnew
if [ -z "$uuidnew" ]; then
  uuidnew=$(cat /proc/sys/kernel/random/uuid)
fi
if [[ $uuidnew =~ ^\{?[A-F0-9a-f]{8}-[A-F0-9a-f]{4}-[A-F0-9a-f]{4}-[A-F0-9a-f]{4}-[A-F0-9a-f]{12}\}?$ ]]; then
  echo -e "${green}uuid valid${NC}"
else
  echo -e "${red}uuid tidak valid${NC}"
  exit 0
fi
validasiuuid=$(grep -rw "/usr/local/etc/xray/config.json" -e "$uuidnew" | awk {'print $2'} | sed 's/"level"://g' | tr -d '"' | tr -d ',' | sort -u)
if [ "$uuidnew" == "$validasiuuid" ]; then
echo -e "${red}uuid sudah digunakan${NC}"
echo -e "${red}uuid already used${NC}"
exit 0
fi
sed -i "s#${uuidold}#${uuidnew}#g" /usr/local/etc/xray/config.json
clear
systemctl restart xray
clear
echo ""
echo -e "${green}CHANGE UUID SUCCESS !${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Protocol : Trojan WS"
echo "Username : $user"
echo "UUID Yang Baru : $uuidnew"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
else
echo "no user found for trojan ws"
exit 0
fi
;;
4)
protocol=$(grep -E -w "VmessGRPC" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4-4 | head -1)
if [[ $protocol = "VmessGRPC" ]]; then
NUMBER_OF_CLIENTS=$(grep -c -E "$protocol " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi
	echo ""
	echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	echo " Custom Change UUID VMESS GRPC"
	echo " Press CTRL+C to return"
	echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	echo "     No User  Expired  Protocol"
	grep -E -w "$protocol " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-4 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
user=$(grep -E -w "$protocol" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
uuidold=$(cat /usr/local/etc/xray/config.json | grep -w "$user" | awk {'print $2'} | tail -n 1 | tr -d '"' | sed 's/level://g' | tr -d ',' | sed 's/add://g')
echo ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Kamu Memilih User : $user"
echo "Current UUID : $uuidold"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
read -p "Please enter the new UUID (leave it blank for a random UUID): " uuidnew
if [ -z "$uuidnew" ]; then
  uuidnew=$(cat /proc/sys/kernel/random/uuid)
fi
if [[ $uuidnew =~ ^\{?[A-F0-9a-f]{8}-[A-F0-9a-f]{4}-[A-F0-9a-f]{4}-[A-F0-9a-f]{4}-[A-F0-9a-f]{12}\}?$ ]]; then
  echo -e "${green}uuid valid${NC}"
else
  echo -e "${red}uuid tidak valid${NC}"
  exit 0
fi
validasiuuid=$(grep -rw "/usr/local/etc/xray/config.json" -e "$uuidnew" | awk {'print $2'} | sed 's/"level"://g' | tr -d '"' | tr -d ',' | sort -u)
if [ "$uuidnew" == "$validasiuuid" ]; then
echo -e "${red}uuid sudah digunakan${NC}"
echo -e "${red}uuid already used${NC}"
exit 0
fi
sed -i "s#${uuidold}#${uuidnew}#g" /usr/local/etc/xray/config.json
clear
systemctl restart xray
systemctl restart nginx
echo ""
echo -e "${green}CHANGE UUID SUCCESS !${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Protocol : Vmess GRPC"
echo "Username : $user"
echo "UUID Yang Baru : $uuidnew"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
else
echo "no user found for vmess grpc"
exit 0
fi
;;
5)
protocol=$(grep -E -w "VlessGRPC" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4-4 | head -1)
if [[ $protocol = "VlessGRPC" ]]; then
NUMBER_OF_CLIENTS=$(grep -c -E "$protocol " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi
	echo ""
	echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	echo " Custom Change UUID VLESS GRPC"
	echo " Press CTRL+C to return"
	echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	echo "     No User  Expired  Protocol"
	grep -E -w "$protocol " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-4 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
user=$(grep -E -w "$protocol" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
uuidold=$(cat /usr/local/etc/xray/config.json | grep -w "$user" | awk {'print $2'} | tail -n 1 | tr -d '"' | sed 's/level://g' | tr -d ',' | sed 's/add://g')
echo ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Kamu Memilih User : $user"
echo "Current UUID : $uuidold"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
read -p "Please enter the new UUID (leave it blank for a random UUID): " uuidnew
if [ -z "$uuidnew" ]; then
  uuidnew=$(cat /proc/sys/kernel/random/uuid)
fi
if [[ $uuidnew =~ ^\{?[A-F0-9a-f]{8}-[A-F0-9a-f]{4}-[A-F0-9a-f]{4}-[A-F0-9a-f]{4}-[A-F0-9a-f]{12}\}?$ ]]; then
  echo -e "${green}uuid valid${NC}"
else
  echo -e "${red}uuid tidak valid${NC}"
  exit 0
fi
validasiuuid=$(grep -rw "/usr/local/etc/xray/config.json" -e "$uuidnew" | awk {'print $2'} | sed 's/"level"://g' | tr -d '"' | tr -d ',' | sort -u)
if [ "$uuidnew" == "$validasiuuid" ]; then
echo -e "${red}uuid sudah digunakan${NC}"
echo -e "${red}uuid already used${NC}"
exit 0
fi
sed -i "s#${uuidold}#${uuidnew}#g" /usr/local/etc/xray/config.json
clear
systemctl restart xray
systemctl restart nginx
echo ""
echo -e "${green}CHANGE UUID SUCCESS !${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Protocol : Vless GRPC"
echo "Username : $user"
echo "UUID Yang Baru : $uuidnew"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
else
echo "no user found for vless grpc"
exit 0
fi
;;
6)
protocol=$(grep -E -w "TrojanGRPC" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4-4 | head -1)
if [[ $protocol = "TrojanGRPC" ]]; then
NUMBER_OF_CLIENTS=$(grep -c -E "$protocol " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi
	echo ""
	echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	echo " Custom Change UUID TROJAN GRPC"
	echo " Press CTRL+C to return"
	echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	echo "     No User  Expired  Protocol"
	grep -E -w "$protocol " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-4 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
user=$(grep -E -w "$protocol" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
uuidold=$(cat /usr/local/etc/xray/config.json | grep -w "$user" | awk {'print $2'} | tail -n 1 | tr -d '"' | sed 's/level://g' | tr -d ',' | sed 's/add://g')
echo ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Kamu Memilih User : $user"
echo "Current UUID : $uuidold"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
read -p "Please enter the new UUID (leave it blank for a random UUID): " uuidnew
if [ -z "$uuidnew" ]; then
  uuidnew=$(cat /proc/sys/kernel/random/uuid)
fi
if [[ $uuidnew =~ ^\{?[A-F0-9a-f]{8}-[A-F0-9a-f]{4}-[A-F0-9a-f]{4}-[A-F0-9a-f]{4}-[A-F0-9a-f]{12}\}?$ ]]; then
  echo -e "${green}uuid valid${NC}"
else
  echo -e "${red}uuid tidak valid${NC}"
  exit 0
fi
validasiuuid=$(grep -rw "/usr/local/etc/xray/config.json" -e "$uuidnew" | awk {'print $2'} | sed 's/"level"://g' | tr -d '"' | tr -d ',' | sort -u)
if [ "$uuidnew" == "$validasiuuid" ]; then
echo -e "${red}uuid sudah digunakan${NC}"
echo -e "${red}uuid already used${NC}"
exit 0
fi
sed -i "s#${uuidold}#${uuidnew}#g" /usr/local/etc/xray/config.json
clear
systemctl restart xray
systemctl restart nginx
echo ""
echo -e "${green}CHANGE UUID SUCCESS !${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Protocol : Trojan GRPC"
echo "Username : $user"
echo "UUID Yang Baru : $uuidnew"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
else
echo "no user found for trojan grpc"
exit 0
fi
;;
7)
protocol=$(grep -E -w "Vmess-TCP" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4-4 | head -1)
if [[ $protocol = "Vmess-TCP" ]]; then
NUMBER_OF_CLIENTS=$(grep -c -E "$protocol " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi
	echo ""
	echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	echo " Custom Change UUID VMESS TCP HTTP"
	echo " Press CTRL+C to return"
	echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	echo "     No User  Expired  Protocol"
	grep -E -w "$protocol " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-4 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
user=$(grep -E -w "$protocol" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
uuidold=$(cat /usr/local/etc/xray/config.json | grep -w "$user" | awk {'print $2'} | tail -n 1 | tr -d '"' | sed 's/level://g' | tr -d ',')
echo ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Kamu Memilih User : $user"
echo "Current UUID : $uuidold"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
read -p "Please enter the new UUID (leave it blank for a random UUID): " uuidnew
if [ -z "$uuidnew" ]; then
  uuidnew=$(cat /proc/sys/kernel/random/uuid)
fi
if [[ $uuidnew =~ ^\{?[A-F0-9a-f]{8}-[A-F0-9a-f]{4}-[A-F0-9a-f]{4}-[A-F0-9a-f]{4}-[A-F0-9a-f]{12}\}?$ ]]; then
  echo -e "${green}uuid valid${NC}"
else
  echo -e "${red}uuid tidak valid${NC}"
  exit 0
fi
validasiuuid=$(grep -rw "/usr/local/etc/xray/config.json" -e "$uuidnew" | awk {'print $2'} | sed 's/"level"://g' | tr -d '"' | tr -d ',' | sort -u)
if [ "$uuidnew" == "$validasiuuid" ]; then
echo -e "${red}uuid sudah digunakan${NC}"
echo -e "${red}uuid already used${NC}"
exit 0
fi
sed -i "s#${uuidold}#${uuidnew}#g" /usr/local/etc/xray/config.json
clear
systemctl restart xray
echo ""
echo -e "${green}CHANGE UUID SUCCESS !${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Protocol : Vmess TCP HTTP"
echo "Username : $user"
echo "UUID Yang Baru : $uuidnew"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
else
echo "no user found for vmess tcp http"
exit 0
fi
;;
8)
protocol=$(grep -E -w "VlessXTLS" "/usr/local/etc/xray/will666.json" | cut -d ' ' -f 4-4 | head -1)
if [[ $protocol = "VlessXTLS" ]]; then
NUMBER_OF_CLIENTS=$(grep -c -E "$protocol " "/usr/local/etc/xray/will666.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi
	echo ""
	echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	echo " Custom Change UUID VLESS TCP XTLS"
	echo " Press CTRL+C to return"
	echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	echo "     No User  Expired  Protocol"
	grep -E -w "$protocol " "/usr/local/etc/xray/will666.json" | cut -d ' ' -f 2-4 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
user=$(grep -E -w "$protocol" "/usr/local/etc/xray/will666.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
uuidold=$(cat /usr/local/etc/xray/will666.json | grep -w "$user" | awk {'print $2'} | tail -n 1 | tr -d '"' | sed 's/level://g' | tr -d ',' | sed 's/flow://g')
echo ""
read -p "Please enter the new UUID (leave it blank for a random UUID): " uuidnew
if [ -z "$uuidnew" ]; then
  uuidnew=$(cat /proc/sys/kernel/random/uuid)
fi
if [[ $uuidnew =~ ^\{?[A-F0-9a-f]{8}-[A-F0-9a-f]{4}-[A-F0-9a-f]{4}-[A-F0-9a-f]{4}-[A-F0-9a-f]{12}\}?$ ]]; then
  echo -e "${green}uuid valid${NC}"
else
  echo -e "${red}uuid tidak valid${NC}"
  exit 0
fi
validasiuuid=$(grep -rw "/usr/local/etc/xray/will666.json" -e "$uuidnew" | awk {'print $2'} | sed 's/"level"://g' | tr -d '"' | tr -d ',' | sort -u)
if [ "$uuidnew" == "$validasiuuid" ]; then
echo -e "${red}uuid sudah digunakan${NC}"
echo -e "${red}uuid already used${NC}"
exit 0
fi
sed -i "s#${uuidold}#${uuidnew}#g" /usr/local/etc/xray/will666.json
clear
systemctl restart will666
echo ""
echo -e "${green}CHANGE UUID SUCCESS !${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Protocol : Vless TCP XTLS"
echo "Username : $user"
echo "UUID Yang Baru : $uuidnew"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
else
echo "no user found for vless tcp xtls"
exit 0
fi
;;
9)
protocol=$(grep -E -w "Trojan" "/usr/local/etc/xray/will69.json" | cut -d ' ' -f 4-4 | head -1)
if [[ $protocol = "Trojan" ]]; then
NUMBER_OF_CLIENTS=$(grep -c -E "$protocol " "/usr/local/etc/xray/will69.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi
	echo ""
	echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	echo " Custom Change UUID TROJAN TCP"
	echo " Press CTRL+C to return"
	echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	echo "     No User  Expired  Protocol"
	grep -E -w "$protocol " "/usr/local/etc/xray/will69.json" | cut -d ' ' -f 2-4 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
user=$(grep -E -w "$protocol" "/usr/local/etc/xray/will69.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
uuidold=$(cat /usr/local/etc/xray/will69.json | grep -w "$user" | awk {'print $2'} | tail -n 1 | tr -d '"' | sed 's/level://g' | tr -d ',')
echo ""
read -p "Please enter the new UUID (leave it blank for a random UUID): " uuidnew
if [ -z "$uuidnew" ]; then
  uuidnew=$(cat /proc/sys/kernel/random/uuid)
fi
if [[ $uuidnew =~ ^\{?[A-F0-9a-f]{8}-[A-F0-9a-f]{4}-[A-F0-9a-f]{4}-[A-F0-9a-f]{4}-[A-F0-9a-f]{12}\}?$ ]]; then
  echo -e "${green}uuid valid${NC}"
else
  echo -e "${red}uuid tidak valid${NC}"
  exit 0
fi
validasiuuid=$(grep -rw "/usr/local/etc/xray/will69.json" -e "$uuidnew" | awk {'print $2'} | sed 's/"level"://g' | tr -d '"' | tr -d ',' | sort -u)
if [ "$uuidnew" == "$validasiuuid" ]; then
echo -e "${red}uuid sudah digunakan${NC}"
echo -e "${red}uuid already used${NC}"
exit 0
fi
sed -i "s#${uuidold}#${uuidnew}#g" /usr/local/etc/xray/will69.json
clear
systemctl restart will69
echo ""
echo -e "${green}CHANGE UUID SUCCESS !${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Protocol : Trojan TCP"
echo "Username : $user"
echo "UUID Yang Baru : $uuidnew"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
else
echo "no user found for trojan tcp"
exit 0
fi
;;
x)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac