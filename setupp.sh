#!/bin/bash

# Warna dan teks
bold='\033[1m'
red='\e[1;31m'
green='\e[0;32m'
yellow='\e[1;33m'
NC='\e[0m'

# Update & install paket-paket penting
apt update && apt install -y wget curl lolcat figlet jq dnsutils socat python3-pip

# Validasi OS
source /etc/os-release
OS_NAME=$ID
OS_VERSION=$VERSION_ID

if [[ "$OS_NAME" == "ubuntu" && ( "$OS_VERSION" == "20.04" || "$OS_VERSION" == "22.04" ) ]]; then
    echo -e "${green}OS supported: Ubuntu $OS_VERSION${NC}"
elif [[ "$OS_NAME" == "debian" && "$OS_VERSION" == "10" ]]; then
    echo -e "${green}OS supported: Debian 10${NC}"
else
    echo -e "${red}OS $OS_NAME $OS_VERSION not supported${NC}"
    exit 1
fi

# Pastikan lolcat tersedia
command -v lolcat >/dev/null || gem install lolcat

# Cek izin root
if [ "${EUID}" -ne 0 ]; then
    echo -e "${red}You need to run this script as root${NC}"
    exit 1
fi

# Pastikan bukan OpenVZ
if [ "$(systemd-detect-virt)" == "openvz" ]; then
    echo -e "${red}OpenVZ is not supported${NC}"
    exit 1
fi

# Deteksi IP publik
MYIP=$(curl -sS ipinfo.io/ip)

# Ganti iptables ke legacy (untuk script lama)
update-alternatives --set iptables /usr/sbin/iptables-legacy 2>/dev/null
update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy 2>/dev/null

# Tampilkan banner
clear
figlet -f small -t "       ALVI TUNNEL" | lolcat
echo -e "                 ${green}AUTOSCRIPT INSTALLER v1${NC}  -  ${bold}©2020-2023${NC}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "     $red TELEGRAM $NC : t.me/Alvi_cell"
echo -e "     $red nomor wa $NC : 082183496832"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Pilihan domain
while [[ ! "$opsi" =~ ^[1-2]$ ]]; do
    echo ""
    echo -e "${bold}Silahkan Pilih !:${NC}"
    echo -e "1. Menggunakan Domain Sendiri"
    echo -e "2. Menggunakan Domain Dari Script"
    echo ""
    read -p "Masukkan angka opsi: " -n 1 -r opsi
    echo ""
done

# Setup domain manual atau dari script
if [[ $opsi == "1" ]]; then
    read -p "Input Your Domain        : " domen
    read -p "Input Your NS Domain     : " domens
    mkdir -p /var/lib/premium-script /etc/xray /etc/v2ray /etc/ns
    echo "IP=$domen" > /var/lib/premium-script/ipvps.conf
    echo "$domen" > /etc/xray/domain
    echo "$domen" > /etc/v2ray/domain
    echo "$domens" > /etc/ns/domain
else
    echo "Anda Akan Menggunakan Domain ${bold}alvicell.my.id${NC}"
    AUTH_EMAIL="Alvibackup9@gmail.com"
    AUTH_KEY="3f47bac0cfac6554c619bb734fd79a70cdaf2"
    DOMAIN="alvicell.my.id"

    ZONE_ID=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=$DOMAIN&status=active" \
        -H "X-Auth-Email: $AUTH_EMAIL" \
        -H "X-Auth-Key: $AUTH_KEY" \
        -H "Content-Type: application/json" | jq -r .result[0].id)

    DNS_RECORDS=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records?per_page=1000" \
        -H "X-Auth-Email: $AUTH_EMAIL" \
        -H "X-Auth-Key: $AUTH_KEY" \
        -H "Content-Type: application/json")

    echo "$DNS_RECORDS" | jq -r '.result[] | @base64' | base64 -d > /tmp/decoded_file.txt
    ip_hasil=$(grep -w "$MYIP" /tmp/decoded_file.txt | jq -r '.name')

    if [ -z "$ip_hasil" ]; then
        echo "Tidak ditemukan IP, pointing baru..."
        wget --no-check-certificate -q https://raw.githubusercontent.com/kyt-team/premium/main/cf.sh
        chmod +x cf.sh && ./cf.sh && rm -f cf.sh
    else
        echo "IP ditemukan, menggunakan domain: $ip_hasil"
        mkdir -p /var/lib/premium-script /etc/xray /etc/v2ray /etc/ns
        echo "IP=$ip_hasil" > /var/lib/premium-script/ipvps.conf
        echo "$ip_hasil" > /etc/xray/domain
        echo "$ip_hasil" > /etc/v2ray/domain
        echo "dns.$ip_hasil" > /etc/ns/domain
    fi
fi

# Validasi pointing domain
domainku=$(cat /etc/xray/domain)
LOOKUP=$(dig +short "$domainku" | grep "$MYIP")
if [[ -z "$LOOKUP" ]]; then
    echo -e "${red}Domain tidak valid, tidak mengarah ke IP VPS ini.${NC}"
    exit 1
else
    echo -e "${green}Domain valid! Mengarah ke VPS.${NC}"
fi

# Setup direktori
mkdir -p /etc/xray/vmess /etc/william /var/lib/premium-script
touch /etc/xray/domain /etc/v2ray/domain /var/lib/premium-script/ipvps.conf /etc/william/subscribe

# Setup Sertifikat SSL (gunakan acme.sh)
hostnameku="$domainku"
systemctl stop nginx 2>/dev/null
apt install -y socat
export ACME_USE_WGET=1
[ ! -d /root/.acme.sh ] && curl https://get.acme.sh | sh
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d "$hostnameku" --standalone --keylength ec-384 --force \
  && /root/.acme.sh/acme.sh --install-cert -d "$hostnameku" --ecc \
  --fullchain-file /etc/ssl/private/fullchain.pem \
  --key-file /etc/ssl/private/privkey.pem

chown -R nobody:nogroup /etc/ssl/private/
chmod 777 /etc/ssl/private/
chmod +x /etc/ssl/private/fullchain.pem /etc/ssl/private/privkey.pem

# Jalankan semua installer
repo="kyt-team/premium/main"
for script in setup-sshvpn.sh set-br.sh ssh-ws-ssl.sh sstp.sh wireguard.sh only-l2tp.sh requirement.sh; do
    wget --no-check-certificate -q "https://raw.githubusercontent.com/$repo/$script"
    chmod +x "$script" && ./"$script" && rm -f "$script"
done

# Install tools tambahan
cd /usr/bin
git clone https://github.com/willstore69/subfinders && cd subfinders
pip3 install -r requirements.txt
mv knockpy ingfo /usr/bin
cd .. && rm -rf subfinders
chmod +x /usr/bin/ingfo
cd

# Cleanup
rm -rf log-install.txt
chown -R nobody:nogroup /etc/ssl/private/
chmod 777 /etc/ssl/private/
chmod +x /etc/ssl/private/fullchain.pem /etc/ssl/private/privkey.pem
systemctl restart xray

# Catatan Akhir
echo -e "${green}INSTALLATION COMPLETED!${NC}"
echo -e "Log: /root/log-install.txt"
echo '1' > /home/ver
sleep 15
reboot
