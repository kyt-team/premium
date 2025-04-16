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

DOMAIN=$(cat /etc/xray/domain);
DOMAINXRAY=$(cat /etc/xray/domain);
nsdomain=$(cat /etc/ns/domain);
clear
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "   [1]  Change/Add New Domain + Include Renew Cert"
echo -e "    +  Your Domain IS $green$DOMAIN $NC"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "   [2]  Change/Add New NS Domain"
echo -e "    +  Your NS Domain IS $green$nsdomain $NC"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "   [x]  Kembali Ke Menu"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e ""
read -p "   Select From Options [1-2 or x] :  " prot
echo -e ""
case $prot in
1)
read -rp "Domain/Host: " -e host
echo -e "$green Starting..... $NC"
sleep 2
LOOKUP=$(nslookup "$host" | awk -F':' '/^Address: / { matched = 1 } matched { print $2}' | grep "$MYIP" | cut -d " " -f 2);
echo "Please Wait, We Will Check Your Domain"
sleep 2
if [[ $MYIP = $LOOKUP ]]; then
echo -e "$green Domain is Valid And Pointed To $MYIP $NC"
else
echo -e "$red UPS ! looks like the domain you entered is not valid"
echo -e "$red please recheck the domain you entered is correct"
echo -e "$red please point the domain to ip and try again $NC"
exit 0
fi
echo -e "$green Starting Added Subdomain And Renew Cert.... $NC"
sleep 2
source ~/.bashrc
if nc -z localhost 80;then
echo -e "Starting To Stop Port 80 Before Continue"
echo -e "Please Wait..."
sleep 2
awikwok=$(netstat -ntlulp | grep -w "80" | awk {'print $7'} | cut -d "/" -f 2 | sed 's/://g' | sort | uniq);
systemctl stop $awikwok > /dev/null 2>&1
systemctl stop $awikwok@none > /dev/null 2>&1
echo -e "${green}success stop port 80${NC}"
fi
/root/.acme.sh/acme.sh --upgrade --auto-upgrade
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $host --standalone --keylength ec-384 --force
~/.acme.sh/acme.sh --install-cert -d $host --ecc --fullchain-file /etc/ssl/private/fullchain.pem --key-file /etc/ssl/private/privkey.pem
chown -R nobody:nogroup /etc/ssl/private/
chmod 777 /etc/ssl/private/
chmod +x /etc/ssl/private/fullchain.pem
chmod +x /etc/ssl/private/privkey.pem
echo $host > /etc/xray/domain
echo $host > /etc/v2ray/domain
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
sed -i "s/$DOMAINXRAY/$host/g" /usr/local/etc/xray/none.json
sed -i "s/$DOMAINXRAY/$host/g" /usr/local/etc/xray/config.json
sed -i "s/$DOMAINXRAY/$host/g" /etc/nginx/conf.d/alone.conf
sed -i "s/$DOMAINXRAY/$host/g" /etc/nginx/conf.d/vmnone.conf
sed -i "s/$DOMAINXRAY/$host/g" /etc/nginx/conf.d/vlnone.conf
clear
echo -e "$green Successfully Added New Domain And Renew Cert $NC"
systemctl start $awikwok > /dev/null 2>&1
systemctl start $awikwok@none > /dev/null 2>&1
systemctl restart $awikwok > /dev/null 2>&1
systemctl restart $awikwok@none > /dev/null 2>&1
systemctl restart will69 > /dev/null 2>&1
systemctl restart will666 > /dev/null 2>&1
systemctl restart nginx
echo -e "$green Successfully Start Port 80 $NC"
;;
2)
old=$(cat /etc/ns/domain)
clear
echo -e "   $red Please Read This Carefully $NC"
echo -e "   IF You Dont Know What You Are Doing. Please ${red}Stop !${NC}"
echo -e "   Changing the NS DOMAIN incorrectly will result in ${red}SLOWDNS${NC} not working properly"
echo ""
read -p "Input Your New NS Domain : " new
echo -e "$green Starting..... $NC"
sleep 2
sed -i "s/$old/$new/g" /etc/systemd/system/slowdns.service
echo $new > /etc/ns/domain
systemctl daemon-reload
sleep 1
systemctl restart slowdns.service
clear
echo -e "$green Successfully Added New NS Domain $NC"
;;
x)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac