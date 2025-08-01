#!/bin/bash

# Warna
bold='\033[1m'
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'

clear
# Deteksi OS
if [[ -e /etc/os-release ]]; then
  source /etc/os-release
else
  echo -e "${red}File /etc/os-release tidak ditemukan. Tidak bisa mendeteksi versi OS.${NC}"
  exit 1
fi

# Cek apakah Ubuntu
if [[ "$ID" != "ubuntu" ]]; then
  echo -e "${red}Script ini hanya mendukung Ubuntu.${NC}"
  exit 1
fi

# Cek versi Ubuntu
case "$VERSION_ID" in
  20.04*|22.04*|24.04*|25.04*)
    echo -e "${green}Versi Ubuntu $VERSION_ID terdeteksi. Melanjutkan instalasi...${NC}"
    sleep 2
    ;;
  *)
    echo -e "${red}Versi Ubuntu tidak didukung. Hanya Ubuntu 20.04, 22.04, 24.04, dan 25.04 yang didukung.${NC}"
    exit 1
    ;;
esac

# Update & Install dependencies
apt update -y && apt upgrade -y
apt install -y wget curl jq figlet lolcat dnsutils socat software-properties-common

# Tambahan untuk Python jika diperlukan
if ! command -v python3 &>/dev/null; then
  echo -e "${green}Menginstal Python 3...${NC}"
  apt install -y python3 python3-pip python3-venv
fi

# Tambahan distutils jika dibutuhkan
apt install -y python3-distutils || true

# Menampilkan banner
figlet "Setup VPS" | lolcat
echo -e "${green}Instalasi awal selesai. VPS siap digunakan.${NC}"

export DEBIAN_FRONTEND=noninteractive
apt update && apt upgrade -y
apt install -y wget curl figlet jq dnsutils socat python3-pip git lolcat > /dev/null 2>&1

apt install wget -y
apt install curl -y
apt install lolcat -y
apt install figlet -y
apt install jq -y
apt install dnsutils -y
apt install socat -y
source /etc/os-release
OS=$ID
if [[ $OS == 'debian' ]]; then
cp /usr/games/lolcat /usr/bin
fi
sleep 1
IP=$(curl -sS ipinfo.io/ip > /tmp/ipaddress.txt)
MYIP=$(cat /tmp/ipaddress.txt)
repogithub='kyt-team/premium/main'
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi

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
clear

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

figlet -f small -t "       ALVI TUNNEL" | lolcat
echo -e "                 ${green}AUTOSCRIPT INSTALLER v1${NC}  -  ${bold}©2020-2023${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "     $red TELEGRAM $NC : t.me/Alvi_cell"
echo -e "     $red nomor wa $NC : 082183496832"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
while [[ ! "$opsi" =~ ^[1-2]$ ]]
do
echo ""
echo -e "${bold}Silahkan Pilih !:"
echo -e "1. Menggunakan Domain Sendiri [using your own domain]"
echo -e "2. Menggunakan Domain Dari Script [using domain from script]${NC}"
echo ""
read -p "Masukkan angka opsi: " -n 1 -r opsi
if [[ $opsi == "1" ]]; then
echo ""
echo "Opsi 1 terpilih ✓"
read -p "Input Your Domain  : " domen
echo ""
sleep 1
echo -e "Tutorial How to Pointing NS Domain"
echo -e "Readme : https://t.me/Alvi_cell"
echo ""
read -p "Input Your NS Domain : " domens
echo "Proses... Mohon Menunggu"
sleep 2
mkdir /var/lib/premium-script;
mkdir -p /etc/xray/
mkdir -p /etc/v2ray/
mkdir -p /etc/ns/
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/ns/domain
echo "IP=$domen" > /var/lib/premium-script/ipvps.conf
echo $domen > /etc/xray/domain
echo $domen > /etc/v2ray/domain
echo $domens > /etc/ns/domain
sleep 1
elif [[ $opsi == "2" ]]; then
echo ""
echo "Opsi 2 terpilih ✓"
sleep 2
echo -e "Anda Akan Menggunakan Domain ${bold}alvicell.my.id${NC}"
sleep 2
echo -e "Dengan Random Subdomain Yang Dipilih Oleh Script"
sleep 2
echo -e "Tetapi Jika IP Anda Telah Terdeteksi Pernah Menggunakan Domain Dari Script."
sleep 1
echo -e "${bold}System Akan Memprioritaskan Itu.${NC}"
sleep 4
  echo "Check Domain...."
  sleep 3
MYIP=$(curl ipinfo.io/ip)
AUTH_EMAIL="Alvibackup9@gmail.com"
AUTH_KEY="3f47bac0cfac6554c619bb734fd79a70cdaf2"
DOMAIN="alvicell.my.id"

ZONE_ID=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
     -H "X-Auth-Email: ${AUTH_EMAIL}" \
     -H "X-Auth-Key: ${AUTH_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

DNS_RECORDS=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records?per_page=1000" \
-H "X-Auth-Email: $AUTH_EMAIL" \
-H "X-Auth-Key: $AUTH_KEY" \
-H "Content-Type: application/json")

echo "${DNS_RECORDS}" | jq -r '.result[] | @base64' > /tmp/hasil-enc.txt
base64 -d /tmp/hasil-enc.txt > /tmp/decoded_file.txt
dns_record_json=$(cat /tmp/decoded_file.txt)
id=$(echo "${dns_record_json}" | jq -r '.id')
type=$(echo "${dns_record_json}" | jq -r '.type')
name=$(echo "${dns_record_json}" | jq -r '.name')
content=$(echo "${dns_record_json}" | jq -r '.content')
echo "$name" > /tmp/hasil-name.txt
echo "$content" > /tmp/hasil-content.txt
paste /tmp/hasil-name.txt /tmp/hasil-content.txt > /tmp/hasil-paste.txt
ip_hasil=$(cat /tmp/hasil-paste.txt | grep -w "$MYIP")
if [ -z "$ip_hasil" ]; then
echo ""
echo "Tidak Ada IP Yang Terdaftar Di System..."
sleep 2
echo "Pointing IP Otomatis...."
sleep 3
wget --no-check-certificate -q https://raw.githubusercontent.com/$repogithub/cf.sh && chmod +x cf.sh && ./cf.sh && rm -rf cf.sh
else
cek_domain=$(cat /tmp/hasil-paste.txt | grep -w "$MYIP" | awk {'print $1'} | tr -d '*' | head -1 | sed 's/^\.//')
echo ""
echo "IP $MYIP Pernah Dipointing Dengan $cek_domain"
echo "System Akan Otomatis Melanjutkan Dengan Domain : $cek_domain"
sleep 3
mkdir /var/lib/premium-script;
mkdir -p /etc/xray/
mkdir -p /etc/v2ray/
mkdir -p /etc/ns/
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/ns/domain
echo "IP=$cek_domain" >> /var/lib/premium-script/ipvps.conf
echo $cek_domain > /etc/xray/domain
echo $cek_domain > /etc/v2ray/domain
echo dns.$cek_domain > /etc/ns/domain
fi
fi
done

sleep 3
source /etc/os-release
OS=$ID
if [[ $OS == 'debian' ]]; then
cp /usr/games/lolcat /usr/bin
fi
clear
sleep 1
domainku=$(cat /etc/xray/domain)
echo "Your Domain Is $domainku"
echo -e "$green Starting..... $NC"
sleep 2
LOOKUP=$(nslookup "$domainku" | awk -F':' '/^Address: / { matched = 1 } matched { print $2}' | grep "$MYIP" | cut -d " " -f 2);
echo -e "$green Check Domain Is valid and pointed To IP Address $NC"
sleep 2
if [[ $MYIP = $LOOKUP ]]; then
echo -e "$green Domain is Valid ! $NC"
else
echo -e "$red UPS ! looks like the domain you entered is not valid"
echo -e "$red please recheck the domain you entered is correct"
echo -e "$red please point the domain to ip and try again $NC"
exit 0
fi 

# added directory
mkdir -p /etc/xray/
mkdir -p /etc/v2ray/
mkdir -p /etc/xray/vmess/
mkdir -p /etc/william/
touch /etc/xray/domain
touch /etc/v2ray/domain
mkdir -p /var/lib/premium-script/
touch /var/lib/premium-script/ipvps.conf
touch /etc/william/subscribe

hostnameku=$( cat /etc/xray/domain )
echo -e "Checking Certificate...."
mkdir -p /etc/ssl/private/
mkdir -p /etc/ssl/private/
touch /etc/ssl/private/fullchain.pem
touch /etc/ssl/private/privkey.pem
FILEEXX=/etc/ssl/private/fullchain.pem
if [[ -z $(grep '[^[:space:]]' $FILEEXX) ]] ; then
echo -e "${yellow}Certificate Not Found !${NC}"
echo -e "Starting Added Certificate Please wait..."
sleep 3
apt install -y socat
export ACME_USE_WGET=1
if ! [ -d /root/.acme.sh ];then curl https://get.acme.sh | sh;fi
~/.acme.sh/acme.sh --set-default-ca --server letsencrypt
~/.acme.sh/acme.sh --upgrade --auto-upgrade  && /root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
~/.acme.sh/acme.sh --issue -d $hostnameku --standalone --keylength ec-384 --force && ~/.acme.sh/acme.sh --install-cert -d $hostnameku --ecc --fullchain-file /etc/ssl/private/fullchain.pem --key-file /etc/ssl/private/privkey.pem
sleep 1
chown -R nobody:nogroup /etc/ssl/private/
chmod 777 /etc/ssl/private/
chmod +x /etc/ssl/private/fullchain.pem
chmod +x /etc/ssl/private/privkey.pem
else
echo -e "${green}Certificate Found ! skipped.${NC}"
fi
sleep 1
clear
# ssh vpn
wget --no-check-certificate -q https://raw.githubusercontent.com/$repogithub/setup-sshvpn.sh && chmod +x setup-sshvpn.sh && ./setup-sshvpn.sh && rm -rf setup-sshvpn.sh
clear
sleep 2
# backup
wget --no-check-certificate -q https://raw.githubusercontent.com/$repogithub/set-br.sh && chmod +x set-br.sh && ./set-br.sh && rm -rf set-br.sh
clear
sleep 2
# ssh ws ssl
wget --no-check-certificate -q https://raw.githubusercontent.com/$repogithub/ssh-ws-ssl.sh && chmod +x ssh-ws-ssl.sh && ./ssh-ws-ssl.sh && rm -rf ssh-ws-ssl.sh
clear
sleep 2
# sstp
wget --no-check-certificate -q https://raw.githubusercontent.com/$repogithub/sstp.sh && chmod +x sstp.sh && ./sstp.sh && rm -rf sstp.sh
clear
sleep 2
# wireguard
wget --no-check-certificate -q https://raw.githubusercontent.com/$repogithub/wireguard.sh && chmod +x wireguard.sh && ./wireguard.sh && rm -rf wireguard.sh
clear
sleep 2
# l2tp
wget --no-check-certificate -q https://raw.githubusercontent.com/$repogithub/only-l2tp.sh && chmod +x only-l2tp.sh && ./only-l2tp.sh && rm -rf only-l2tp.sh
clear
sleep 2
# Requirement
wget --no-check-certificate -q https://raw.githubusercontent.com/$repogithub/requirement.sh && chmod +x requirement.sh && ./requirement.sh && rm -rf requirement.sh
cd
sleep 3
cd /usr/bin
git clone https://github.com/willstore69/subfinders
sleep 1
cd subfinders
pip3 install -r requirements.txt
mv knockpy /usr/bin
mv ingfo /usr/bin
cd /usr/bin
rm -rf /usr/bin/subfinders
chmod +x ingfo
cd
rm -rf log-install.txt
apt install dnsutils -y
sleep 2
chown -R nobody:nogroup /etc/ssl/private/
chmod 777 /etc/ssl/private/
chmod +x /etc/ssl/private/fullchain.pem
chmod +x /etc/ssl/private/privkey.pem
systemctl restart xray
FILEEXX=/etc/ssl/private/fullchain.pem
if [[ -z $(grep '[^[:space:]]' $FILEEXX) ]] ; then
echo -e "${yellow}Certificate Not Found !${NC}"
echo -e "Starting Added Certificate Please wait..."
sleep 3
apt install -y socat
export ACME_USE_WGET=1
if ! [ -d /root/.acme.sh ];then curl https://get.acme.sh | sh;fi
~/.acme.sh/acme.sh --set-default-ca --server letsencrypt
~/.acme.sh/acme.sh --upgrade --auto-upgrade  && /root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
~/.acme.sh/acme.sh --issue -d $hostnameku --standalone --keylength ec-384 --force && ~/.acme.sh/acme.sh --install-cert -d $hostnameku --ecc --fullchain-file /etc/ssl/private/fullchain.pem --key-file /etc/ssl/private/privkey.pem
sleep 1
chown -R nobody:nogroup /etc/ssl/private/
chmod 777 /etc/ssl/private/
chmod +x /etc/ssl/private/fullchain.pem
chmod +x /etc/ssl/private/privkey.pem
else
echo -e "${green}Certificate Found ! skipped.${NC}"
fi
clear
echo " "
echo "Installation has been completed!!"
echo " "
echo "==========================- AUTOSCRIPT -============================="  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "###############################" | tee -a log-install.txt
echo "#         ALVI TUNNEL         #" | tee -a log-install.txt
echo "###############################" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "---------------------------------------------------------------------"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - Webmin                  : 10000"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN TCP             : 1194"  | tee -a log-install.txt
echo "   - OpenVPN UDP             : 2200"  | tee -a log-install.txt
echo "   - OpenVPN SSL             : 442"  | tee -a log-install.txt
echo "   - OpenVPN WS              : 2095"  | tee -a log-install.txt
echo "   - Stunnel5                : 443"  | tee -a log-install.txt
echo "   - SSHWS                   : 2052"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo "   - XRAY TLS                : 443"  | tee -a log-install.txt
echo "   - VMNONE                  : 80"  | tee -a log-install.txt
echo "   - VLNONE                  : 8880"  | tee -a log-install.txt
echo "   - IKEv2/IPSEC VPN         : 4500"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Sesuai tkp"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Clear Log On            : Every 5 Hour"  | tee -a log-install.txt
echo "   - Auto Delete Expired Acc : 00.00 wib"  | tee -a log-install.txt
echo "   - Autobackup Data Via GMAIL"  | tee -a log-install.txt
echo "   - Autobackup Data Via BOT Telegram"  | tee -a log-install.txt
echo "   - Restore Data"  | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""   | tee -a log-install.txt
echo "   - Dev/Main                : ALVI TUNNEL"  | tee -a log-install.txt
echo "   - Telegram                : t.me/Alvi_cell"  | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "=================================================================="  | tee -a log-install.txt
echo " Reboot 15 Sec"
cd /root
rm -f setup
rm -rf setup.sh
rm -rf setup1.sh
rm -rf setup1.sh.1
rm -rf setup1.sh.2
rm -rf setup1.sh.3
rm -rf PDirect.js
rm -rf cert.pem
rm -rf key.pem
rm -rf ip
rm -rf wget-log
rm -rf cf.sh
rm -rf dnstt
rm -rf go
rm -rf stunnel-5.69
rm -rf vpn_server_pub_key.pem
history -c
echo '1' > /home/ver
sleep 15
reboot
