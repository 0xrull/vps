#!/bin/bash
# Script Auto Installer By Gidhan Bagus Algary

# Banner SSH
echo " -=[ Selamat Datang Di Server Alga Tekno ]=- " >> /etc/pesan
echo "Peraturan Menggunakan SSH : " >> /etc/pesan
echo "1. Dilarang Keras Menggunakan SSH Untuk DDoS, Hacking, Spam, Torrent, dll | " >> /etc/pesan
echo "2. Dilarang Multilogin, Maks Login Hanya 1 Bitvise |  " >> /etc/pesan
echo "Powered by Gidhan Bagus Algary ~ WA : 0895354663822 |" >> /etc/pesan
echo "Copyright © 2017 - Alga Tekno" >> /etc/pesan

echo "Banner /etc/pesan" >> /etc/ssh/sshd_config

# update software
apt-get update

# go to root
cd

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

# install wget and curl
apt-get -y install wget curl

# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
service ssh restart

# set repo
wget -O /etc/apt/sources.list "https://raw.githubusercontent.com/gidhanbagus/scriptdebian/master/conf/sources.list.debian7"
wget "http://www.dotdeb.org/dotdeb.gpg"
cat dotdeb.gpg | apt-key add -;rm dotdeb.gpg

# remove unused
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove sendmail*;
apt-get -y --purge remove bind9*;

# update
apt-get -y update
apt-get -y upgrade

# download webserver
apt-get -y install nginx php5-fpm php5-cli

# install essential package
apt-get -y install bmon iftop htop nmap axel nano iptables traceroute sysv-rc-conf dnsutils bc nethogs openvpn vnstat less screen psmisc apt-file whois ptunnel ngrep mtr git zsh mrtg snmp snmpd snmp-mibs-downloader unzip unrar rsyslog debsums rkhunter
apt-get -y install build-essential

# disable exim
service exim4 stop
sysv-rc-conf exim4 off

# update apt-file
apt-file update

# setting vnstat
vnstat -u -i venet0
service vnstat restart

# install screenfetch
cd
wget https://github.com/KittyKatt/screenFetch/raw/master/screenfetch-dev
mv screenfetch-dev /usr/bin/screenfetch
chmod +x /usr/bin/screenfetch
echo "clear" >> .profile
echo "screenfetch" >> .profile

# install webserver
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/gidhanbagus/scriptjancok/master/conf/nginx.conf"
mkdir -p /home/vps/public_html
echo "<pre>Setup by Gidhan Bagus Algary" > /home/vps/public_html/index.html
echo "<?php phpinfo(); ?>" > /home/vps/public_html/info.php
wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/gidhanbagus/scriptjancok/master/conf/vps.conf"
sed -i 's/listen = \/var\/run\/php5-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php5/fpm/pool.d/www.conf
service php5-fpm restart
service nginx restart

# install badvpn
wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/gidhanbagus/scriptdebian/master/conf/badvpn-udpgw"
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300' /etc/rc.local
chmod +x /usr/bin/badvpn-udpgw
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300

# install mrtg
wget -O /etc/snmp/snmpd.conf "https://raw.githubusercontent.com/gidhanbagus/scriptdebian/master/conf/snmpd.conf"
wget -O /root/mrtg-mem.sh "https://raw.githubusercontent.com/gidhanbagus/scriptdebian/master/conf/mrtg-mem.sh"
chmod +x /root/mrtg-mem.sh
cd /etc/snmp/
sed -i 's/TRAPDRUN=no/TRAPDRUN=yes/g' /etc/default/snmpd
service snmpd restart
snmpwalk -v 1 -c public localhost 1.3.6.1.4.1.2021.10.1.3.1
mkdir -p /home/vps/public_html/mrtg
cfgmaker --zero-speed 100000000 --global 'WorkDir: /home/vps/public_html/mrtg' --output /etc/mrtg.cfg public@localhost
curl "https://raw.githubusercontent.com/gidhanbagus/scriptdebian/master/conf/mrtg.conf" >> /etc/mrtg.cfg
sed -i 's/WorkDir: \/var\/www\/mrtg/# WorkDir: \/var\/www\/mrtg/g' /etc/mrtg.cfg
sed -i 's/# Options\[_\]: growright, bits/Options\[_\]: growright/g' /etc/mrtg.cfg
indexmaker --output=/home/vps/public_html/mrtg/index.html /etc/mrtg.cfg
if [ -x /usr/bin/mrtg ] && [ -r /etc/mrtg.cfg ]; then mkdir -p /var/log/mrtg ; env LANG=C /usr/bin/mrtg /etc/mrtg.cfg 2>&1 | tee -a /var/log/mrtg/mrtg.log ; fi
if [ -x /usr/bin/mrtg ] && [ -r /etc/mrtg.cfg ]; then mkdir -p /var/log/mrtg ; env LANG=C /usr/bin/mrtg /etc/mrtg.cfg 2>&1 | tee -a /var/log/mrtg/mrtg.log ; fi
if [ -x /usr/bin/mrtg ] && [ -r /etc/mrtg.cfg ]; then mkdir -p /var/log/mrtg ; env LANG=C /usr/bin/mrtg /etc/mrtg.cfg 2>&1 | tee -a /var/log/mrtg/mrtg.log ; fi
cd

# setting port ssh
sed -i '/Port 22/a Port 143' /etc/ssh/sshd_config
sed -i 's/Port 22/Port  22/g' /etc/ssh/sshd_config
service ssh restart

# install dropbear
apt-get -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=443/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 80 -p 109 -p 110"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
service ssh restart
service dropbear restart

# install vnstat gui
cd /home/vps/public_html/
wget http://www.sqweek.com/sqweek/files/vnstat_php_frontend-1.5.1.tar.gz
tar xf vnstat_php_frontend-1.5.1.tar.gz
rm vnstat_php_frontend-1.5.1.tar.gz
mv vnstat_php_frontend-1.5.1 vnstat
cd vnstat
sed -i 's/eth0/venet0/g' config.php
sed -i "s/\$iface_list = array('venet0', 'sixxs');/\$iface_list = array('venet0');/g" config.php
sed -i "s/\$language = 'nl';/\$language = 'en';/g" config.php
sed -i 's/Internal/Internet/g' config.php
sed -i '/SixXS IPv6/d' config.php
cd

# install fail2ban
apt-get -y install fail2ban
service fail2ban restart

# install squid3
wget https://raw.githubusercontent.com/gidhanbagus/scriptjancok3/master/squid3.sh
chmod 100 squid3.sh
./squid3.sh

# install webmin
cd
wget "http://prdownloads.sourceforge.net/webadmin/webmin_1.831_all.deb"
dpkg --install webmin_1.831_all.deb;
apt-get -y -f install;
rm /root/webmin_1.831_all.deb
service webmin restart
service vnstat restart

# download script
cd
wget -O /usr/bin/akun "https://raw.githubusercontent.com/gidhanbagus/scriptdebian/master/akun"
wget -O /usr/bin/buat "https://raw.githubusercontent.com/gidhanbagus/scriptjancok2/master/user-new.sh"
wget -O /usr/bin/cek "https://raw.githubusercontent.com/gidhanbagus/scriptjancok3/master/user-login.sh"
wget -O /usr/bin/gusur "https://raw.githubusercontent.com/gidhanbagus/scriptdebian/master/gusur"
wget -O /usr/bin/trial "https://raw.githubusercontent.com/gidhanbagus/scriptdebian/master/user-trial.sh"
wget -O speedtest.py "https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py"
wget -O /usr/bin/speedtest "https://raw.githubusercontent.com/gidhanbagus/scriptdebian/master/speedtest.sh"
wget -O /usr/bin/bench "https://raw.githubusercontent.com/gidhanbagus/scriptdebian/master/conf/bench-network.sh"
wget -O /usr/bin/autokill "https://raw.githubusercontent.com/gidhanbagus/scriptdebian/master/autokill"
wget -O /usr/bin/ram "https://raw.github.com/pixelb/ps_mem/master/ps_mem.py"
wget -O /usr/bin/autoreboot "https://raw.githubusercontent.com/gidhanbagus/scriptjancok2/master/reboot.sh"
chmod +x /usr/bin/akun
chmod +x /usr/bin/buat
chmod +x /usr/bin/cek
chmod +x /usr/bin/gusur
chmod +x /usr/bin/trial
chmod +x /usr/bin/bench
chmod +x speedtest.py
chmod +x /usr/bin/speedtest
chmod +x /usr/bin/ram
chmod +x /usr/bin/autokill

# cron
echo "0 0 * * * root /usr/bin/autoreboot" > /etc/cron.d/autoreboot
echo "0 0 * * * root /usr/bin/gusur" > /etc/cron.d/gusur
echo "* * * * * root /usr/bin/autokill" > /etc/cron.d/autokill
echo "* * * * * root sleep 5; /usr/bin/autokill" > /etc/cron.d/autokill
echo "* * * * * root sleep 15; /usr/bin/autokill" > /etc/cron.d/autokill
echo "* * * * * root sleep 20; /usr/bin/autokill" > /etc/cron.d/autokill
echo "* * * * * root sleep 25; /usr/bin/autokill" > /etc/cron.d/autokill
echo "* * * * * root sleep 30; /usr/bin/autokill" > /etc/cron.d/autokill
echo "* * * * * root sleep 35; /usr/bin/autokill" > /etc/cron.d/autokill
echo "* * * * * root sleep 40; /usr/bin/autokill" > /etc/cron.d/autokill
echo "* * * * * root sleep 45; /usr/bin/autokill" > /etc/cron.d/autokill
echo "* * * * * root sleep 50; /usr/bin/autokill" > /etc/cron.d/autokill
echo "* * * * * root sleep 55; /usr/bin/autokill" > /etc/cron.d/autokill

# finalisasi
service cron restart
service nginx start
service php-fpm start
service vnstat restart
service snmpd restart
service ssh restart
service dropbear restart
service fail2ban restart
service webmin restart

# info
clear
echo "Server By : Gidhan Bagus Algary" | tee log-install.txt
echo "===============================" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "Layanan yang aktif pada server ini :"  | tee -a log-install.txt
echo "--------------------------------------"  | tee -a log-install.txt
echo "OpenSSH  : 22, 143"  | tee -a log-install.txt
echo "Dropbear : 80, 109, 110, 443"  | tee -a log-install.txt
echo "Squid3   : 8080, 3128 (limit to IP SSH)"  | tee -a log-install.txt
echo "Badvpn   : badvpn-udpgw port 7300"  | tee -a log-install.txt
echo "--------------------------------------"  | tee -a log-install.txt
echo "Script Command"  | tee -a log-install.txt
echo "--------------------------------------"  | tee -a log-install.txt
echo "akun : untuk melihat daftar akun ssh beserta tanggal expirednya"  | tee -a log-install.txt
echo "buat : untuk membuat user ssh tunnel baru"  | tee -a log-install.txt
echo "cek : untuk melihat siapa saja yang sedang aktif"  | tee -a log-install.txt
echo "gusur : untuk menghapus user yang masa aktifnya sudah habis"  | tee -a log-install.txt
echo "trial : untuk membuat akun trial"  | tee -a log-install.txt
echo "autokill : untuk kill user yang multilogin"  | tee -a log-install.txt
echo "speedtest : untuk tes speed vps"  | tee -a log-install.txt
echo "ram : untuk melihat pemakaian ram vps"  | tee -a log-install.txt
echo "bench : untuk melihat performa vps"  | tee -a log-install.txt
echo "--------------------------------------"  | tee -a log-install.txt
echo "Fitur lain"  | tee -a log-install.txt
echo "--------------------------------------"  | tee -a log-install.txt
echo "Webmin   : https://$MYIP:10000/"  | tee -a log-install.txt
echo "Vnstat   : http://$MYIP/vnstat/"  | tee -a log-install.txt
echo "MRTG     : http://$MYIP/mrtg/"  | tee -a log-install.txt
echo "Timezone : Asia/Jakarta"  | tee -a log-install.txt
echo "Fail2Ban : [on]"  | tee -a log-install.txt
echo "IPv6     : [off]"  | tee -a log-install.txt
echo "Autokill Multilogin : [on]"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "Log Installasi --> /root/log-install.txt"  | tee -a log-install.txt
echo "Log Installasi --> /root/log-reboot.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "Server By : Gidhan Bagus Algary"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "VPS AUTO REBOOT SETIAP 24 JAM !"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "===============================================" | tee -a log-install.txt
