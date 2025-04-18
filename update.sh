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

cd /usr/bin
wget --no-check-certificate -q -O menu2 "https://raw.githubusercontent.com/$repogithub/menu2.sh"
wget --no-check-certificate -q -O menu3 "https://raw.githubusercontent.com/$repogithub/menu3.sh"
wget --no-check-certificate -q -O del-exp "https://raw.githubusercontent.com/$repogithub/del-exp.sh"
wget --no-check-certificate -q -O menu "https://raw.githubusercontent.com/$repogithub/menu.sh"
wget --no-check-certificate -q -O menu-setting "https://raw.githubusercontent.com/$repogithub/menu-setting.sh"
wget --no-check-certificate -q -O menu-ss "https://raw.githubusercontent.com/$repogithub/menu-ss.sh"
wget --no-check-certificate -q -O menu-ssh "https://raw.githubusercontent.com/$repogithub/menu-ssh.sh"
wget --no-check-certificate -q -O menu-tr "https://raw.githubusercontent.com/$repogithub/menu-tr.sh"
wget --no-check-certificate -q -O menu-trgrpc "https://raw.githubusercontent.com/$repogithub/menu-trgrpc.sh"
wget --no-check-certificate -q -O menu-trws "https://raw.githubusercontent.com/$repogithub/menu-trws.sh"
wget --no-check-certificate -q -O menu-vless "https://raw.githubusercontent.com/$repogithub/menu-vless.sh"
wget --no-check-certificate -q -O menu-vlessgrpc "https://raw.githubusercontent.com/$repogithub/menu-vlessgrpc.sh"
wget --no-check-certificate -q -O menu-vlessxtls "https://raw.githubusercontent.com/$repogithub/menu-vlessxtls.sh"
wget --no-check-certificate -q -O menu-vmess "https://raw.githubusercontent.com/$repogithub/menu-vmess.sh"
echo -e "PROSES...."
wget --no-check-certificate -q -O menu-vmessgrpc "https://raw.githubusercontent.com/$repogithub/menu-vmessgrpc.sh"
wget --no-check-certificate -q -O menu-vmesstcp "https://raw.githubusercontent.com/$repogithub/menu-vmesstcp.sh"
wget --no-check-certificate -q -O add-ssh "https://raw.githubusercontent.com/$repogithub/add-ssh.sh"
wget --no-check-certificate -q -O trial-ssh "https://raw.githubusercontent.com/$repogithub/trial-ssh.sh"
wget --no-check-certificate -q -O add-vlessxtls "https://raw.githubusercontent.com/$repogithub/add-vlessxtls.sh"
wget --no-check-certificate -q -O trial-vlessxtls "https://raw.githubusercontent.com/$repogithub/trial-vlessxtls.sh"
wget --no-check-certificate -q -O add-vmess "https://raw.githubusercontent.com/$repogithub/add-vmess.sh"
wget --no-check-certificate -q -O trial-vmess "https://raw.githubusercontent.com/$repogithub/trial-vmess.sh"
wget --no-check-certificate -q -O add-vless "https://raw.githubusercontent.com/$repogithub/add-vless.sh"
wget --no-check-certificate -q -O trial-vless "https://raw.githubusercontent.com/$repogithub/trial-vless.sh"
wget --no-check-certificate -q -O add-vmesstcp "https://raw.githubusercontent.com/$repogithub/add-vmesstcp.sh"
wget --no-check-certificate -q -O trial-vmesstcp "https://raw.githubusercontent.com/$repogithub/trial-vmesstcp.sh"
wget --no-check-certificate -q -O add-tr "https://raw.githubusercontent.com/$repogithub/add-tr.sh"
wget --no-check-certificate -q -O trial-tr "https://raw.githubusercontent.com/$repogithub/trial-tr.sh"
wget --no-check-certificate -q -O add-trws "https://raw.githubusercontent.com/$repogithub/add-trws.sh"
wget --no-check-certificate -q -O add-ss "https://raw.githubusercontent.com/$repogithub/add-ss.sh"
wget --no-check-certificate -q -O clear-log "https://raw.githubusercontent.com/$repogithub/clear-log.sh"
wget --no-check-certificate -q -O cek-tls "https://raw.githubusercontent.com/$repogithub/cek-tls.sh"
wget --no-check-certificate -q -O cek-ntls "https://raw.githubusercontent.com/$repogithub/cek-ntls.sh"
wget --no-check-certificate -q -O change-port "https://raw.githubusercontent.com/$repogithub/change-port.sh"
wget --no-check-certificate -q -O force-host "https://raw.githubusercontent.com/$repogithub/force-host.sh"
wget --no-check-certificate -q -O backup-bot "https://raw.githubusercontent.com/$repogithub/backup-bot.sh"
wget --no-check-certificate -q -O bckp-bot "https://raw.githubusercontent.com/$repogithub/bckp-bot.sh"
wget --no-check-certificate -q -O traffic-xraytls "https://raw.githubusercontent.com/$repogithub/traffic-xraytls.sh"
wget --no-check-certificate -q -O traffic-xrayntls "https://raw.githubusercontent.com/$repogithub/traffic-xrayntls.sh"
wget --no-check-certificate -q -O update-kernel "https://raw.githubusercontent.com/$repogithub/update-kernel.sh"
wget --no-check-certificate -q -O fix-kernel-cloud "https://raw.githubusercontent.com/$repogithub/fix-kernel-cloud.sh"
wget --no-check-certificate -q -O auto-sendvpn "https://raw.githubusercontent.com/$repogithub/auto-sendvpn.sh"
wget --no-check-certificate -q -O auto-sendall "https://raw.githubusercontent.com/$repogithub/auto-sendall.sh"
wget --no-check-certificate -q -O del-tr "https://raw.githubusercontent.com/$repogithub/del-tr.sh"
wget --no-check-certificate -q -O del-trws "https://raw.githubusercontent.com/$repogithub/del-trws.sh"
wget --no-check-certificate -q -O del-vless "https://raw.githubusercontent.com/$repogithub/del-vless.sh"
wget --no-check-certificate -q -O del-vlessxtls "https://raw.githubusercontent.com/$repogithub/del-vlessxtls.sh"
wget --no-check-certificate -q -O del-vmess "https://raw.githubusercontent.com/$repogithub/del-vmess.sh"
wget --no-check-certificate -q -O del-vmesstcp "https://raw.githubusercontent.com/$repogithub/del-vmesstcp.sh"
wget --no-check-certificate -q -O del-ss "https://raw.githubusercontent.com/$repogithub/del-ss.sh"
wget --no-check-certificate -q -O detail-tr "https://raw.githubusercontent.com/$repogithub/detail-tr.sh"
wget --no-check-certificate -q -O detail-trws "https://raw.githubusercontent.com/$repogithub/detail-trws.sh"
wget --no-check-certificate -q -O detail-vless "https://raw.githubusercontent.com/$repogithub/detail-vless.sh"
wget --no-check-certificate -q -O detail-vlessxtls "https://raw.githubusercontent.com/$repogithub/detail-vlessxtls.sh"
wget --no-check-certificate -q -O detail-vmess "https://raw.githubusercontent.com/$repogithub/detail-vmess.sh"
wget --no-check-certificate -q -O detail-vmesstcp "https://raw.githubusercontent.com/$repogithub/detail-vmesstcp.sh"
wget --no-check-certificate -q -O detail-ss "https://raw.githubusercontent.com/$repogithub/detail-ss.sh"
wget --no-check-certificate -q -O detail-vmessgrpc "https://raw.githubusercontent.com/$repogithub/detail-vmessgrpc.sh"
wget --no-check-certificate -q -O detail-vlessgrpc "https://raw.githubusercontent.com/$repogithub/detail-vlessgrpc.sh"
wget --no-check-certificate -q -O detail-trgrpc "https://raw.githubusercontent.com/$repogithub/detail-trgrpc.sh"
wget --no-check-certificate -q -O renew-tr "https://raw.githubusercontent.com/$repogithub/renew-tr.sh"
wget --no-check-certificate -q -O renew-trws "https://raw.githubusercontent.com/$repogithub/renew-trws.sh"
wget --no-check-certificate -q -O renew-vless "https://raw.githubusercontent.com/$repogithub/renew-vless.sh"
wget --no-check-certificate -q -O renew-vlessxtls "https://raw.githubusercontent.com/$repogithub/renew-vlessxtls.sh"
wget --no-check-certificate -q -O renew-vmess "https://raw.githubusercontent.com/$repogithub/renew-vmess.sh"
wget --no-check-certificate -q -O renew-vmesstcp "https://raw.githubusercontent.com/$repogithub/renew-vmesstcp.sh"
wget --no-check-certificate -q -O renew-ss "https://raw.githubusercontent.com/$repogithub/renew-ss.sh"
wget --no-check-certificate -q -O restart "https://raw.githubusercontent.com/$repogithub/restart.sh"
echo "MASIH PROSES HEHE..."
wget --no-check-certificate -q -O auto-certxray "https://raw.githubusercontent.com/$repogithub/auto-certxray.sh"
wget --no-check-certificate -q -O update-version "https://raw.githubusercontent.com/$repogithub/update-version.sh"
wget --no-check-certificate -q -O path-ss "https://raw.githubusercontent.com/$repogithub/path-ss.sh"
wget --no-check-certificate -q -O path-trws "https://raw.githubusercontent.com/$repogithub/path-trws.sh"
wget --no-check-certificate -q -O path-vless "https://raw.githubusercontent.com/$repogithub/path-vless.sh"
wget --no-check-certificate -q -O path-vmess "https://raw.githubusercontent.com/$repogithub/path-vmess.sh"
wget --no-check-certificate -q -O path-vmesstcp "https://raw.githubusercontent.com/$repogithub/path-vmesstcp.sh"
wget --no-check-certificate -q -O path-vmessgrpc "https://raw.githubusercontent.com/$repogithub/path-vmessgrpc.sh"
wget --no-check-certificate -q -O path-vlessgrpc "https://raw.githubusercontent.com/$repogithub/path-vlessgrpc.sh"
wget --no-check-certificate -q -O path-trgrpc "https://raw.githubusercontent.com/$repogithub/path-trgrpc.sh"
wget --no-check-certificate -q -O add-vmessgrpc "https://raw.githubusercontent.com/$repogithub/add-vmessgrpc.sh"
wget --no-check-certificate -q -O renew-vmessgrpc "https://raw.githubusercontent.com/$repogithub/renew-vmessgrpc.sh"
wget --no-check-certificate -q -O del-vmessgrpc "https://raw.githubusercontent.com/$repogithub/del-vmessgrpc.sh"
wget --no-check-certificate -q -O add-vlessgrpc "https://raw.githubusercontent.com/$repogithub/add-vlessgrpc.sh"
wget --no-check-certificate -q -O del-vlessgrpc "https://raw.githubusercontent.com/$repogithub/del-vlessgrpc.sh"
wget --no-check-certificate -q -O renew-vlessgrpc "https://raw.githubusercontent.com/$repogithub/renew-vlessgrpc.sh"
wget --no-check-certificate -q -O add-trgrpc "https://raw.githubusercontent.com/$repogithub/add-trgrpc.sh"
wget --no-check-certificate -q -O del-trgrpc "https://raw.githubusercontent.com/$repogithub/del-trgrpc.sh"
wget --no-check-certificate -q -O renew-trgrpc "https://raw.githubusercontent.com/$repogithub/renew-trgrpc.sh"
echo "SEBENTAR LAGI SELESAI..."
wget --no-check-certificate -q -O menu-bundling "https://raw.githubusercontent.com/$repogithub/menu-bundling.sh"
wget --no-check-certificate -q -O bundling-vmess "https://raw.githubusercontent.com/$repogithub/bundling-vmess.sh"
wget --no-check-certificate -q -O bundling-vless "https://raw.githubusercontent.com/$repogithub/bundling-vless.sh"
wget --no-check-certificate -q -O bundling-tr "https://raw.githubusercontent.com/$repogithub/bundling-tr.sh"
wget --no-check-certificate -q -O change-slowdns "https://raw.githubusercontent.com/$repogithub/change-slowdns.sh"
wget --no-check-certificate -q -O menu-l2tp "https://raw.githubusercontent.com/$repogithub/menu-l2tp.sh"
wget --no-check-certificate -q -O add-l2tp "https://raw.githubusercontent.com/$repogithub/add-l2tp.sh"
wget --no-check-certificate -q -O del-l2tp "https://raw.githubusercontent.com/$repogithub/del-l2tp.sh"
#wget --no-check-certificate -q -O cek-l2tp "https://raw.githubusercontent.com/$repogithub/cek-l2tp.sh"
wget --no-check-certificate -q -O renew-l2tp "https://raw.githubusercontent.com/$repogithub/renew-l2tp.sh"
wget --no-check-certificate -q -O change-user-udp "https://raw.githubusercontent.com/$repogithub/change-user-udp.sh"
wget --no-check-certificate -q -O change-alt-port "https://raw.githubusercontent.com/$repogithub/change-alt-port.sh"
wget --no-check-certificate -q -O backup "https://raw.githubusercontent.com/$repogithub/backup.sh"
wget --no-check-certificate -q -O bckp "https://raw.githubusercontent.com/$repogithub/bckp.sh"
wget --no-check-certificate -q -O restore "https://raw.githubusercontent.com/$repogithub/restore.sh"
wget --no-check-certificate -q -O warp "https://raw.githubusercontent.com/$repogithub/warp.sh"
wget --no-check-certificate -q -O change-uuid "https://raw.githubusercontent.com/$repogithub/change-uuid.sh"
wget --no-check-certificate -q -O ban-xray "https://raw.githubusercontent.com/$repogithub/evos.sh"
wget --no-check-certificate -q -O unban-xray "https://raw.githubusercontent.com/$repogithub/rrq.sh"
wget --no-check-certificate -q -O add-limit "https://raw.githubusercontent.com/$repogithub/onic.sh"
wget --no-check-certificate -q -O change-limit "https://raw.githubusercontent.com/$repogithub/alterego.sh"
wget --no-check-certificate -q -O unban-ssh "https://raw.githubusercontent.com/$repogithub/bigetron.sh"
wget --no-check-certificate -q -O ban-ssh "https://raw.githubusercontent.com/$repogithub/blacklist.sh"
wget --no-check-certificate -q -O update "https://raw.githubusercontent.com/$repogithub/update.sh"
chmod +x menu-ss
chmod +x menu-setting
chmod +x menu-ssh
chmod +x menu-tr
chmod +x menu-trgrpc
chmod +x menu-trws
chmod +x menu-vless
chmod +x menu-vlessgrpc
chmod +x menu-vlessxtls
chmod +x menu-vmess
chmod +x menu-vmessgrpc
chmod +x menu-vmesstcp
chmod +x add-vlessxtls
chmod +x add-vmess
chmod +x update
chmod +x add-vless
chmod +x add-vmesstcp
chmod +x add-tr
chmod +x add-trws
chmod +x add-ss
chmod +x clear-log
chmod +x cek-tls
chmod +x cek-ntls
chmod +x change-port
chmod +x menu2
chmod +x menu3
chmod +x menu
chmod +x add-ssh
chmod +x trial-ssh
chmod +x force-host
chmod +x del-exp
chmod +x backup-bot
chmod +x bckp-bot
chmod +x update-kernel
chmod +x fix-kernel-cloud
chmod +x auto-sendvpn
chmod +x auto-sendall
chmod +x del-tr
chmod +x del-trws
chmod +x del-vless
chmod +x del-vlessxtls
chmod +x del-vmess
chmod +x del-vmesstcp
chmod +x del-ss
chmod +x detail-tr
chmod +x detail-trws
chmod +x detail-vless
chmod +x detail-vlessxtls
chmod +x detail-vmess
chmod +x detail-vmesstcp
chmod +x detail-ss
chmod +x detail-vmessgrpc
chmod +x detail-vlessgrpc
chmod +x detail-trgrpc
chmod +x renew-tr
chmod +x renew-trws
chmod +x renew-vless
chmod +x renew-vlessxtls
chmod +x renew-vmess
chmod +x renew-vmesstcp
chmod +x renew-ss
chmod +x restart
chmod +x auto-certxray
chmod +x path-ss
chmod +x path-trws
chmod +x path-vless
chmod +x path-vmess
chmod +x path-vmesstcp
chmod +x path-vmessgrpc
chmod +x path-vlessgrpc 
chmod +x path-trgrpc 
chmod +x update-version
chmod +x add-vmessgrpc
chmod +x renew-vmessgrpc
chmod +x del-vmessgrpc
chmod +x add-vlessgrpc
chmod +x del-vlessgrpc
chmod +x renew-vlessgrpc
chmod +x add-trgrpc
chmod +x del-trgrpc
chmod +x renew-trgrpc
chmod +x menu-bundling
chmod +x bundling-vmess
chmod +x bundling-vless
chmod +x bundling-tr
chmod +x change-slowdns
chmod +x add-l2tp
chmod +x del-l2tp
#chmod +x cek-l2tp
chmod +x renew-l2tp
chmod +x menu-l2tp
chmod +x change-user-udp
chmod +x change-alt-port
chmod +x backup
chmod +x bckp
chmod +x restore
chmod +x warp
chmod +x change-uuid
chmod +x ban-xray
chmod +x unban-xray
chmod +x add-limit
chmod +x change-limit
chmod +x unban-ssh
chmod +x ban-ssh
echo "update selesai silakan ketik menu...."
