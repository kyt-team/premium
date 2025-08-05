#!/bin/bash

echo "=== INSTALL DROPBEAR v2019.78 ==="

# 1. Install dropbear dari repo untuk dependensi
echo "[+] Install dropbear dari repo"
apt update -y
apt install -y dropbear wget

# 2. Buat DSS key (opsional, bisa abaikan jika tidak butuh)
echo "[+] Generate DSS key"
dropbearkey -t dss -f /etc/dropbear/dropbear_dss_host_key
chmod 600 /etc/dropbear/dropbear_dss_host_key

# 3. Backup dropbear lama
echo "[+] Backup dropbear lama (jika ada)"
if [ -f /usr/sbin/dropbear ]; then
    mv /usr/sbin/dropbear /usr/sbin/dropbear.bak
    echo "    -> Disimpan di /usr/sbin/dropbear.bak"
fi

# 4. Download binary dropbear versi 2019.78
echo "[+] Download dropbear 2019.78 dari GitHub"
wget -q -O dropbear_2019 "https://github.com/goldax7/os/raw/main/dropbear_v2019.78"

# 5. Pindahkan ke sistem
echo "[+] Pasang binary baru"
chmod +x dropbear_2019
mv dropbear_2019 /usr/sbin/dropbear

# 6. Pastikan shell login tidak diblokir
echo "[+] Tambahkan /bin/false dan /usr/sbin/nologin ke /etc/shells (jika belum)"
grep -qxF "/bin/false" /etc/shells || echo "/bin/false" >> /etc/shells
grep -qxF "/usr/sbin/nologin" /etc/shells || echo "/usr/sbin/nologin" >> /etc/shells

# 7. Restart SSH dan Dropbear
echo "[+] Restart service OpenSSH dan Dropbear"
/etc/init.d/ssh restart
systemctl restart dropbear

# 8. Tampilkan versi
echo "[+] Verifikasi versi Dropbear:"
dropbear -V
