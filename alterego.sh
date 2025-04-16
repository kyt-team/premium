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
echo ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "CHANGE OR ADD NEW LIMIT IP LOGIN"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e " [1]. VMESS WS"
echo -e " [2]. VLESS WS"
echo -e " [3]. TROJAN WS"
echo -e " [4]. SSH"
echo -e " [x]. EXIT"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e ""
read -p " Select From Options [1-4 or x] :  " prot
echo -e ""
case $prot in
1)
echo ""
protocol=$(grep -E -w "VmessWS-TLS" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4-4 | head -1)
if [[ $protocol = "VmessWS-TLS" ]];
then
echo "found"
else
echo "You have no existing clients!"
exit 1
fi
NUMBER_OF_CLIENTS=$(grep -c -E "$protocol " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi
	clear
	echo ""
	echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	echo " Select User Please :)"
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
ceklimit_ip=$(cat /etc/william/limit-xray/vmessws/$user 2>/dev/null)
if [[ -z $ceklimit_ip ]]; then
echo ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Add Limit IP Login For : $user"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
read -p "New Limit IP Login : " newlimit
echo -e "$newlimit" > "/etc/william/limit-xray/vmessws/$user"
echo ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Add Limit IP Login For : $user ${green}Success !!${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
else
echo ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Change Limit IP Login For : $user"
echo -e "Current Limit IP : $ceklimit_ip"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
read -p "Change Limit IP Login : " changelimit
echo -e "$changelimit" > "/etc/william/limit-xray/vmessws/$user"
echo ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Change Limit IP Login For : $user ${green}Success !!${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
fi
;;
2)
echo ""
protocol=$(grep -E -w "VlessWS-TLS" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4-4 | head -1)
if [[ $protocol = "VlessWS-TLS" ]];
then
echo "found"
else
echo "You have no existing clients!"
exit 1
fi
NUMBER_OF_CLIENTS=$(grep -c -E "$protocol " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi
	clear
	echo ""
	echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	echo " Select User Please :)"
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
ceklimit_ip=$(cat /etc/william/limit-xray/vlessws/$user 2>/dev/null)
if [[ -z $ceklimit_ip ]]; then
echo ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Add Limit IP Login For : $user"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
read -p "New Limit IP Login : " newlimit
echo -e "$newlimit" > "/etc/william/limit-xray/vlessws/$user"
echo ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Add Limit IP Login For : $user ${green}Success !!${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
else
echo ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Change Limit IP Login For : $user"
echo -e "Current Limit IP : $ceklimit_ip"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
read -p "Change Limit IP Login : " changelimit
echo -e "$changelimit" > "/etc/william/limit-xray/vlessws/$user"
echo ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Change Limit IP Login For : $user ${green}Success !!${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
fi
;;
3)
echo ""
protocol=$(grep -E -w "TrojanWS" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4-4 | head -1)
if [[ $protocol = "TrojanWS" ]];
then
echo "found"
else
echo "You have no existing clients!"
exit 1
fi
NUMBER_OF_CLIENTS=$(grep -c -E "$protocol " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi
	clear
	echo ""
	echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	echo " Select User Please :)"
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
ceklimit_ip=$(cat /etc/william/limit-xray/trojanws/$user 2>/dev/null)
if [[ -z $ceklimit_ip ]]; then
echo ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Add Limit IP Login For : $user"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
read -p "New Limit IP Login : " newlimit
echo -e "$newlimit" > "/etc/william/limit-xray/trojanws/$user"
echo ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Add Limit IP Login For : $user ${green}Success !!${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
else
echo ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Change Limit IP Login For : $user"
echo -e "Current Limit IP : $ceklimit_ip"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
read -p "Change Limit IP Login : " changelimit
echo -e "$changelimit" > "/etc/william/limit-xray/trojanws/$user"
echo ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Change Limit IP Login For : $user ${green}Success !!${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
fi
;;
4)
echo "------------------------------------------------------------"
echo "USERNAME          PASSWORD          EXP DATE          STATUS"
echo "------------------------------------------------------------"
while read expired
do
  AKUN="$(echo $expired | cut -d: -f1)"
  ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
  exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
  status="$(passwd -S $AKUN | awk '{print $2}' )"
  password="$(grep -w "^$AKUN" /etc/william/udp/udp.conf | cut -d ">" -f2)"
  if [[ $ID -ge 1000 ]]; then
    if [[ "$status" = "L" ]]; then
      printf "%-17s %-17s %-17s %2s \n" "$AKUN" "$password" "$exp     " "LOCKED"
    else
      printf "%-17s %-17s %-17s %2s \n" "$AKUN" "$password" "$exp     " "UNLOCKED"
    fi
  fi
done < /etc/passwd

JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo "------------------------------------------------------------"
echo "Account number: $JUMLAH user"
echo "------------------------------------------------------------"
echo ""
read -p "Username SSH to Change Limit Or Added: " user
ip_limit_ssh=$(cat /etc/william/limit-ssh/$user 2>/dev/null)
if [[ -z $ip_limit_ssh ]]; then
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Add Limit IP Login For : $user"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
read -p "New Limit IP Login : " newlimit
echo -e "$newlimit" > "/etc/william/limit-ssh/$user"
echo ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Add Limit IP Login For : $user ${green}Success !!${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
else
echo ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Change Limit IP Login For : $user"
echo -e "Current Limit IP : $ip_limit_ssh"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
read -p "Change Limit IP Login : " changelimit
echo -e "$changelimit" > "/etc/william/limit-ssh/$user"
echo ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Change Limit IP Login For : $user ${green}Success !!${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━"
fi
;;
x)
exit
menu
;;
*)
echo "Please enter an correct number"
;;
esac