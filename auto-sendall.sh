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

FILE=/home/apibot3
if [[ -z $(grep '[^[:space:]]' $FILE) ]] ; then
clear
echo -e "UPS ! You Dont Settings Api Bot, Please Use Menu auto-sendvpn First !"
exit 0
fi
chatid=$(cat /home/chatid3)
apibot=$(cat /home/apibot3)
INIPERTAMA () {
DOMAIN=$(cat /etc/xray/domain);
nsdomain=$(cat /etc/ns/domain);
pubkey=$(cat /etc/william/slowdns/server.pub);
clear
IP=$(wget -qO- ipinfo.io/ip);
ssl="$(cat ~/log-install.txt | grep -w "Stunnel5" | cut -d: -f2)"
ssl2="$(cat ~/log-install.txt | grep -w "Stunnel5" | cut -d " " -f 22|sed 's/,//g')"
ws="$(cat ~/log-install.txt | grep -w "SSHWS" | cut -d: -f2|sed 's/ //g')"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpnssl="$(cat ~/log-install.txt | grep -w "OpenVPN SSL" | cut -d: -f2|sed 's/ //g')"
ovpnws="$(cat ~/log-install.txt | grep -w "OpenVPN WS" | cut -d: -f2|sed 's/ //g')"
Login=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=1
echo Ping Host
echo Cek Hak Akses...
sleep 0.5
echo Permission Accepted
clear
sleep 0.5
echo Membuat Akun: $Login
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
curl -s -X POST https://api.telegram.org/bot${apibot}/sendMessage \
 -F chat_id="${chatid}" -F text="
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
INFORMASI TRIAL
SSH & OVPN ACCOUNT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
IP-Addres : $IP
Hostname : $DOMAIN
DNS Hostname : $nsdomain
Username : $Login
Password : $Pass
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Port openssh : 22
Port dropbear : 109, 143
Port stunnel : $ssl
Port ssh websocket http : $ws
Port ssh websocket https : $ssl2
Port ovpn websocket http : $ovpnws
Port squid : 8080, 3128
Port badvpn/udpgw : 7100-7300
Dns for slowdns : 1.1.1.1 / 8.8.8.8
Pub key slowdns : $pubkey
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
OPENVPN TCP : $ovpn http://$DOMAIN:8081/client-tcp-$ovpn.ovpn
OPENVPN UDP : $ovpn2 http://$DOMAIN:8081/client-udp-$ovpn2.ovpn
OPENVPN SSL : $ovpnssl http://$DOMAIN:8081/client-tcp-ssl-$ovpnssl.ovpn
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Payload Websocket HTTP : GET / HTTP/1.1[crlf]Host: $DOMAIN[crlf]Upgrade: websocket[crlf][crlf]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Payload Websocket HTTPS : GET wss://isi_bug_disini/ HTTP/1.1[crlf]Host: $DOMAIN[crlf]Upgrade: Websocket[crlf]Connection: Keep-Alive[crlf][crlf]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Expired on : $exp"
INIKEDUA
}

INIKEDUA () {
MYIP=$(curl -sS ipinfo.io/ip)
DOMAIN=$(cat /etc/xray/domain);
pathku=$(cat /etc/xray/path/trojan_ws_path)
source /var/lib/premium-script/ipvps.conf
tls="$(cat ~/log-install.txt | grep -w "TLS" | cut -d: -f2|sed 's/ //g')"
user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
exp=`date --date="-1 days ago" +"%Y-%m-%d"`
sed -i '/#trojanws$/a\### '"$user $exp TrojanWS "'\
,{"password": "'""$uuid""'","level": '"0"',"email": "'""$user""'"}' /usr/local/etc/xray/config.json
trojanlink="trojan://${uuid}@isi_bug_disini:${tls}?path=${pathku}&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
curl -s -X POST https://api.telegram.org/bot${apibot}/sendMessage \
 -F chat_id="${chatid}" -F text="
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
━━━━[XRAY/TROJAN_WS]━━━━
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Remarks : ${user}
Hostname : ${domain}
port : ${tls}
Key : ${uuid}
Path : ${pathku}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
link : ${trojanlink}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Expired On : $exp"
INIKETIGA
}

INIKETIGA () {
MYIP=$(curl -sS ipinfo.io/ip)
DOMAIN=$(cat /etc/xray/domain);
source /var/lib/premium-script/ipvps.conf
tls="$(cat ~/log-install.txt | grep -w "TLS" | cut -d: -f2|sed 's/ //g')"
user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
exp=`date --date="-1 days ago" +"%Y-%m-%d"`
sed -i '/#trojantcp$/a\### '"$user $exp Trojan "'\
,{"password": "'""$uuid""'","level": '"0"',"email": "'""$user""'"}' /usr/local/etc/xray/will69.json
trojanlink="trojan://$uuid@$domain:$tls?security=tls&alpn=http/1.1&headerType=none&type=tcp&sni=isi_bug_disini#$user"
curl -s -X POST https://api.telegram.org/bot${apibot}/sendMessage \
 -F chat_id="${chatid}" -F text="
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
━━━━[XRAY/TROJAN]━━━━
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Remarks : ${user}
Hostname : ${DOMAIN}
port : ${tls}
Key : ${uuid}
Network : TCP
Alpn : http/1.1
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
link : ${trojanlink}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Expired On : $exp"
INIKEEMPAT
}

INIKEEMPAT () {
MYIP=$(curl -sS ipinfo.io/ip)
DOMAIN=$(cat /etc/xray/domain);
pathku=$(cat /etc/xray/path/vless_ws_path)
source /var/lib/premium-script/ipvps.conf
tls="$(cat ~/log-install.txt | grep -w "TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "VLNONE" | cut -d: -f2|sed 's/ //g')"
user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "A client with the specified name $Login was already created, please choose another name."
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
exp=`date --date="-1 days ago" +"%Y-%m-%d"`
sed -i '/#vlessws$/a\### '"$user $exp VlessWS-TLS "'\
,{"id": "'""$uuid""'","level": '"0"',"email": "'""$user""'"}' /usr/local/etc/xray/config.json
sed -i '/#vlessWS$/a\### '"$user $exp VlessWS-NTLS "'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/none.json
vlesslink1="vless://${uuid}@${domain}:$tls?path=${pathku}&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:$none?path=${pathku}&encryption=none&type=ws#${user}"
curl -s -X POST https://api.telegram.org/bot${apibot}/sendMessage \
 -F chat_id="${chatid}" -F text="
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
━━━━[XRAY/VLESS_WS]━━━━
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Remarks : ${user}
Domain : ${domain}
port TLS : $tls
port none TLS : $none
id : ${uuid}
Encryption : none
network : ws
path : ${pathku}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
link TLS : ${vlesslink1}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
link none TLS : ${vlesslink2}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Expired On : $exp"
INIKELIMA
}

INIKELIMA () {
MYIP=$(curl -sS ipinfo.io/ip)
DOMAIN=$(cat /etc/xray/domain);
source /var/lib/premium-script/ipvps.conf
tls="$(cat ~/log-install.txt | grep -w "TLS" | cut -d: -f2|sed 's/ //g')"
user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
exp=`date --date="-1 days ago" +"%Y-%m-%d"`
sed -i '/#vlessxtls$/a\### '"$user $exp VlessXTLS "'\
,{"id": "'""$uuid""'","flow": "'"xtls-rprx-direct"'","level": '"0"',"email": "'""$user""'"}' /usr/local/etc/xray/will666.json
vlesslink1="vless://${uuid}@${domain}:${tls}?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=isi_bug_disini#${user}"
curl -s -X POST https://api.telegram.org/bot${apibot}/sendMessage \
 -F chat_id="${chatid}" -F text="
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
━━━━[XRAY/VLESS_XTLS]━━━━
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Remarks : ${user}
Domain : ${domain}
port TLS : ${tls}
id : ${uuid}
security : xtls
Encryption : none
network : tcp
flow : xtls-rprx-direct
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
link TLS : ${vlesslink1}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Expired On : $exp"
INIKEENAM
}

INIKEENAM () {
MYIP=$(curl -sS ipinfo.io/ip)
DOMAIN=$(cat /etc/xray/domain);
pathku=$(cat /etc/xray/path/vmess_ws_path)
source /var/lib/premium-script/ipvps.conf
tls="$(cat ~/log-install.txt | grep -w "TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "VMNONE" | cut -d: -f2|sed 's/ //g')"
user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "A client with the specified name $Login was already created, please choose another name."
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
exp=`date --date="-1 days ago" +"%Y-%m-%d"`
sed -i '/#vmessws$/a\### '"$user $exp VmessWS-TLS "'\
,{"id": "'""$uuid""'","level": '"0"',"email": "'""$user""'"}' /usr/local/etc/xray/config.json
sed -i '/#vmessWS$/a\### '"$user $exp VmessWS-NTLS "'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/none.json
cat>/etc/xray/vmess/$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "${pathku}",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF
cat>/etc/xray/vmess/$user-none.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${none}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "${pathku}",
      "type": "none",
      "host": "",
      "tls": "none"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmesslink1="vmess://$(base64 -w 0 /etc/xray/vmess/$user-tls.json)"
vmesslink2="vmess://$(base64 -w 0 /etc/xray/vmess/$user-none.json)"
curl -s -X POST https://api.telegram.org/bot${apibot}/sendMessage \
 -F chat_id="${chatid}" -F text="
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
━━━━[XRAY/VMESS_WS]━━━━
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Remarks : ${user}
Domain : ${domain}
port TLS : ${tls}
port NONE-TLS : ${none}
id : ${uuid}
alterId : 0
Security : auto
network : ws
path : ${pathku}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
link TLS : ${vmesslink1}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
link NONE-TLS : ${vmesslink2}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Expired On : $exp"
INIKETUJUH
}

INIKETUJUH () {
MYIP=$(curl -sS ipinfo.io/ip)
DOMAIN=$(cat /etc/xray/domain);
pathku=$(cat /etc/xray/path/vmess_tcp_path)
source /var/lib/premium-script/ipvps.conf
tls="$(cat ~/log-install.txt | grep -w "TLS" | cut -d: -f2|sed 's/ //g')"
user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
exp=`date --date="-1 days ago" +"%Y-%m-%d"`
sed -i '/#vmesstcp$/a\### '"$user $exp Vmess-TCP "'\
,{"id": "'""$uuid""'","level": '"0"',"email": "'""$user""'"}' /usr/local/etc/xray/config.json
cat>/etc/xray/vmess/$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "tcp",
      "path": "${pathku}",
      "type": "http",
      "host": "",
      "tls": "tls"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmesslink1="vmess://$(base64 -w 0 /etc/xray/vmess/$user-tls.json)"
curl -s -X POST https://api.telegram.org/bot${apibot}/sendMessage \
 -F chat_id="${chatid}" -F text="
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
━━━━[XRAY/VMESS_TCP]━━━━
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Remarks : ${user}
Domain : ${domain}
Port TLS : ${tls}
ID : ${uuid}
Alterid : 0
Security : auto
Network : tcp
Path : ${pathku}
Header Type : http
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
link TLS : ${vmesslink1}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Expired On : $exp"
INIDELAPAN
}

INIDELAPAN () {
MYIP=$(curl -sS ipinfo.io/ip)
serverpsk=$(cat /etc/xray/server-psk);
userpsk=$(openssl rand -base64 32);
pathku=$(cat /etc/xray/path/ss_ws_path)
source /var/lib/premium-script/ipvps.conf
domain=$(cat /etc/xray/domain)
cipher="2022-blake3-aes-256-gcm"
source /var/lib/premium-script/ipvps.conf
tls="$(cat ~/log-install.txt | grep -w "TLS" | cut -d: -f2|sed 's/ //g')"
user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
exp=`date --date="-1 days ago" +"%Y-%m-%d"`
sed -i '/#ss_ws$/a\### '"$user $exp Shadowsocks-TLS "'\
,{"password": "'""$userpsk""'","email": "'""$user""'"}' /usr/local/etc/xray/config.json
echo -n "${cipher}:${serverpsk}:${userpsk}" | base64 -w 0 > /tmp/log
shadowsocks_base64=$(cat /tmp/log)
shadowsockslink="ss://${shadowsocks_base64}@$domain:$tls?path=$pathku&security=tls&host=$domain&type=ws&sni=$domain#${user}"
cat > /home/vps/public_html/ss-ws-$user.txt <<-END
{
  "dns": {
    "hosts": {
      "domain:googleapis.cn": "googleapis.com"
    },
    "servers": [
      "1.1.1.1"
    ]
  },
  "inbounds": [
    {
      "listen": "127.0.0.1",
      "port": 10808,
      "protocol": "socks",
      "settings": {
        "auth": "noauth",
        "udp": true,
        "userLevel": 8
      },
      "sniffing": {
        "destOverride": [
          "http",
          "tls"
        ],
        "enabled": true
      },
      "tag": "socks"
    },
    {
      "listen": "127.0.0.1",
      "port": 10809,
      "protocol": "http",
      "settings": {
        "userLevel": 8
      },
      "tag": "http"
    }
  ],
  "log": {
    "loglevel": "warning"
  },
  "outbounds": [
    {
      "mux": {
        "concurrency": 8,
        "enabled": true
      },
      "protocol": "shadowsocks",
      "settings": {
        "servers": [
          {
            "address": "$domain",
            "level": 8,
            "method": "$cipher",
            "ota": false,
            "password": "$serverpsk:$userpsk",
            "port": $tls
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
        "tlsSettings": {
          "allowInsecure": true,
          "serverName": "$domain"
        },
        "wsSettings": {
          "headers": {
            "Host": "$domain"
          },
          "path": "$pathku"
        }
      },
      "tag": "proxy"
    },
    {
      "protocol": "freedom",
      "settings": {},
      "tag": "direct"
    },
    {
      "protocol": "blackhole",
      "settings": {
        "response": {
          "type": "http"
        }
      },
      "tag": "block"
    }
  ],
  "routing": {
    "domainMatcher": "mph",
    "domainStrategy": "IPIfNonMatch",
    "rules": [
      {
        "ip": [
          "1.1.1.1"
        ],
        "outboundTag": "proxy",
        "port": "53",
        "type": "field"
      }
    ]
  }
}
END
curl -sS -v -F "chat_id=${chatid}" -F document=@/home/vps/public_html/ss-ws-$user.txt -F caption="
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
━━━━[XRAY/SHADOWSOCKS_WS]━━━━
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
REMARKS : ${user}
DOMAIN : ${domain}
PASSWORD : ${serverpsk}:${userpsk}
PORT TLS : ${tls}
CIPHER : ${cipher}
PATH : ${pathku}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
LINK TLS : ${shadowsockslink}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EXPIRED ON : $exp" https://api.telegram.org/bot${apibot}/sendDocument
rm -rf /tmp/log
}
INIPERTAMA
clear
sleep 5
systemctl restart xray
systemctl restart xray@none
/etc/init.d/cron restart