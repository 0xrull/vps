Script Installer VPS by Gidhan Bagus Algary
===================

Script auto installer VPS untuk memudahkan dalam berjualan SSH, VPN, dan Proxy. Script ini telah di install berbagai macam fungsi dan alat yang akan membantu Anda dalam berjualan layanan SSH, VPN dan Proxy.

----------

Requirement
-------------

Sebelum menginstall script ini ada beberapa sistem yang dibutuhkan.

> - Sebuah server / server virtual / cloud server / VPS yang terinstall sistem operasi **Debian 7.x 32bit** dan masih baru.
> - Program terminal emulator seperti [PuTTY](http://www.putty.org/) atau lainnya.

Installation
-------------
Untuk instalasi script silahkan jalankan perintah berikut:
```sh
$ wget https://raw.githubusercontent.com/gidhanbagus/scriptjancok/master/debian7.sh
$ bash debian7.sh
```
atau

```sh
$ wget https://raw.githubusercontent.com/gidhanbagus/scriptjancok/master/debian7.sh && bash debian7.sh
```
Feature
-------------

Layanan yang diaktifkan pada script ini:

 - **Port OpenSSH** : 22, 143
 - **Port Dropbear** : 80, 109, 110, 443
 - **SquidProxy**    : 8080, 3128 (limit to IP SSH)
 - **badvpn**   : badvpn-udpgw port 7300
 - **Webmin**   : http://IP:10000/
 - **vnstat**   : http://IP/vnstat/
 - **MRTG**     : http://IP/mrtg/
 - **Timezone** : Asia/Jakarta
 - **Fail2Ban** : [on]
 - **IPv6**     : [off]
 - **Autokill Multilogin**     : [on]

Beberapa fitur yang tersedia saat ini:

 - **akun** : untuk melihat daftar akun beserta masa aktifnya,
 - **buat** : untuk membuat akun baru,
 - **cek** : untuk melihat user yang sedang login,
 - **userdel (nama akun)** : untuk menghapus akun ssh | cth : userdelete gidhan,
 - **gusur** : untuk menghapus user yang sudah expired,
 - **trial** : untuk membuat akun trial selama 1 hari,
 - **autokill** : untuk kill user yang multilogin,
 - **speedtest** : untuk tes speed vps,
 - **ram** : untuk melihat pemakaian ram vps,
 - **bench** : untuk melihat performa vps,


Beberapa alat atau tools yang dapat Anda gunakan:
<pre>axel, bmon, htop, iftop, mtr, nethogs</pre>
