#!/bin/bash
# Script Auto Installer By Gidhan Bagus Algary

# go to root
cd

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

# install tools
apt-get -y update
apt-get -y upgrade
apt-get -y install nano
apt-get -y install vim
apt-get -y install screen
apt-get -y install wget

# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
service ssh restart

# banner ssh
wget -O /etc/pesan "https://raw.githubusercontent.com/gidhanbagus/scriptasu/master/conf/pesan"
echo "Banner /etc/pesan" >> /etc/ssh/sshd_config

# remove unused
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove sendmail*;
apt-get -y --purge remove bind9*;

# install screenfetch
wget https://github.com/KittyKatt/screenFetch/raw/master/screenfetch-dev
mv screenfetch-dev /usr/bin/screenfetch
chmod +x /usr/bin/screenfetch
echo "clear" >> .profile
echo "screenfetch" >> .profile

# set repo
wget https://raw.githubusercontent.com/gidhanbagus/scriptdebian/master/conf/sources.list.debian7
cp -f source.listdo /etc/apt/sources.list

# jcameron key
wget http://www.webmin.com/jcameron-key.asc
apt-key add jcameron-key.asc

# install webmin
apt-get -y update
apt-get -y install webmin
wget https://raw.githubusercontent.com/gidhanbagus/scriptjancok/master/miniserv.conf
cp -f miniserv.conf /etc/webmin/miniserv.conf

# setting openssh
wget https://raw.githubusercontent.com/gidhanbagus/scriptjancok/master/sshd_config
cp -f sshd_config /etc/ssh/sshd_config

# install dropbear
apt-get -y install dropbear
wget https://raw.githubusercontent.com/gidhanbagus/scriptjancok/master/dropbear
echo "/bin/false" >> /etc/shells

# install fail2ban
apt-get -y install fail2ban
service fail2ban restart

# install squid3
wget https://raw.githubusercontent.com/gidhanbagus/scriptjancok/master/squid3.sh
chmod 100 squid3.sh
./squid3.sh

# setting profile
wget https://raw.githubusercontent.com/gidhanbagus/scriptjancok/master/profile
cp -f profile /etc/profile

# install badvpn
wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/gidhanbagus/scriptdebian/master/conf/badvpn-udpgw"
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300' /etc/rc.local
chmod +x /usr/bin/badvpn-udpgw
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300

# download script
wget -O /usr/bin/akun "https://raw.githubusercontent.com/gidhanbagus/scriptjancok/master/user-list.sh"
wget -O /usr/bin/buat "https://raw.githubusercontent.com/gidhanbagus/scriptjancok/master/user-new.sh"
wget -O /usr/bin/cek "https://raw.githubusercontent.com/gidhanbagus/scriptjancok/master/user-login.sh"
wget -O /usr/bin/gusur "https://raw.githubusercontent.com/gidhanbagus/scriptjancok/master/gusur"
wget -O /usr/bin/trial "https://raw.githubusercontent.com/gidhanbagus/scriptjancok/master/user-trial.sh"
wget -O /usr/bin/speedtest "https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py"
wget -O /usr/bin/tendang "https://raw.githubusercontent.com/gidhanbagus/scriptjancok/master/tendang"
wget -O /usr/bin/ram "https://raw.github.com/pixelb/ps_mem/master/ps_mem.py"
wget -O /usr/bin/autoreboot "https://raw.githubusercontent.com/gidhanbagus/scriptjancok/master/reboot.sh"
echo "cat /root/log-install.txt" | tee /usr/bin/tips
echo "cat /root/log-reboot.txt" | tee /usr/bin/rebootinfo

# set permission
chmod +x /usr/bin/akun
chmod +x /usr/bin/buat
chmod +x /usr/bin/cek
chmod +x /usr/bin/gusur
chmod +x /usr/bin/trial
chmod +x /usr/bin/speedtest
chmod +x /usr/bin/ram
chmod +x /usr/bin/tendang
chmod +x /usr/bin/autoreboot
chmod +x /usr/bin/tips
chmod +x /usr/bin/rebootinfo

# cron
echo "0 0 * * * root /usr/bin/gusur" > /etc/crontab
echo "0 0 * * * root /usr/bin/autoreboot" > /etc/cron.d/autoreboot
echo "* * * * * root /usr/bin/tendang" > /etc/cron.d/tendang
echo "* * * * * root sleep 5; /usr/bin/tendang" > /etc/cron.d/tendang
echo "* * * * * root sleep 15; /usr/bin/tendang" > /etc/cron.d/tendang
echo "* * * * * root sleep 20; /usr/bin/tendang" > /etc/cron.d/tendang
echo "* * * * * root sleep 25; /usr/bin/tendang" > /etc/cron.d/tendang
echo "* * * * * root sleep 30; /usr/bin/tendang" > /etc/cron.d/tendang
echo "* * * * * root sleep 35; /usr/bin/tendang" > /etc/cron.d/tendang
echo "* * * * * root sleep 40; /usr/bin/tendang" > /etc/cron.d/tendang
echo "* * * * * root sleep 45; /usr/bin/tendang" > /etc/cron.d/tendang
echo "* * * * * root sleep 50; /usr/bin/tendang" > /etc/cron.d/tendang
echo "* * * * * root sleep 55; /usr/bin/tendang" > /etc/cron.d/tendang

# finalisasi
service cron restart
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
echo "tendang : untuk kill user yang multilogin"  | tee -a log-install.txt
echo "speedtest : untuk tes speed vps"  | tee -a log-install.txt
echo "ram : untuk melihat pemakaian ram vps"  | tee -a log-install.txt
echo "--------------------------------------"  | tee -a log-install.txt
echo "Fitur lain"  | tee -a log-install.txt
echo "--------------------------------------"  | tee -a log-install.txt
echo "Webmin   : https://$MYIP:10000/"  | tee -a log-install.txt
echo "Timezone : Asia/Jakarta"  | tee -a log-install.txt
echo "Fail2Ban : [on]"  | tee -a log-install.txt
echo "IPv6     : [off]"  | tee -a log-install.txt
echo "Autokill Multilogin : [on]"  | tee -a log-install.txt
echo "--------------------------------------"  | tee -a log-install.txt
echo "Tips Installasi --> tips"  | tee -a log-install.txt
echo "Log Reboot --> rebootinfo"  | tee -a log-install.txt
echo "--------------------------------------"  | tee -a log-install.txt
echo "Server By : Gidhan Bagus Algary"  | tee -a log-install.txt
echo "--------------------------------------"  | tee -a log-install.txt
echo "VPS AUTO REBOOT SETIAP 24 JAM !"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "===============================================" | tee -a log-install.txt
rm -f sshd_config dropbear jcameron-key.asc miniserv.conf source.list profile debian7.sh
