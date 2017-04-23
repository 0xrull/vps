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
$ wget https://raw.githubusercontent.com/gidhanbagus/scriptdebian/master/debian732kvm.sh
$ bash debian732kvm.sh
```
atau

```sh
$ wget https://raw.githubusercontent.com/gidhanbagus/scriptdebian/master/debian732kvm.sh && bash debian732kvm.sh
```
Feature
-------------

Layanan yang diaktifkan pada script ini:

 - **Port OpenSSH** : 22, 143
 - **Port Dropbear** : 109, 110, 443
 - **SquidProxy**    : 80 (limit to IP SSH)
 - **badvpn**   : badvpn-udpgw port 7300
 - **Webmin**   : http://IP:10000/
 - **vnstat**   : http://IP:81/vnstat/
 - **MRTG**     : http://IP:81/mrtg/
 - **Timezone** : Asia/Jakarta
 - **Fail2Ban** : [on]
 - **IPv6**     : [off]

Beberapa fitur yang tersedia saat ini:

 - **akun** : untuk melihat daftar akun beserta masa aktifnya,
 - **buat** : untuk membuat akun baru,
 - **cek** : untuk melihat user yang sedang login,
 - **userdelete (nama akun)** : untuk menghapus akun ssh | cth : userdelete gidhan,
 - **gusur** : untuk menghapus user yang sudah expired,
 - **trial** : untuk membuat akun trial selama 1 hari,
 - **speedtest** : untuk cek speed vps,

Beberapa alat atau tools yang dapat Anda gunakan:
<pre>axel, bmon, htop, iftop, mtr, nethogs</pre>
