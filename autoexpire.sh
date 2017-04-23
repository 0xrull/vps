# Banner SSH
echo "## SELAMAT DATANG DI SERVER PREMIUM $hnbaru ## " >> /etc/pesan
echo "DENGAN MENGGUNAKAN LAYANAN SSH DARI SERVER INI BERARTI ANDA SETUJU SEGALA KETENTUAN YANG TELAH KAMI BUAT: " >> /etc/pesan
echo "1. Tidak diperbolehkan untuk melakukan aktivitas illegal seperti DDoS, Hacking, Phising, Spam, dan Torrent di server ini; " >> /etc/pesan
echo "2. Maks login $llimit kali, jika lebih dari itu maka akun otomatis ditendang oleh server; " >> /etc/pesan
echo "3. Pengguna setuju jika kami mengetahui atau sistem mendeteksi pelanggaran di akunnya maka akun akan dihapus oleh sistem; " >> /etc/pesan
echo "4. Tidak ada tolerasi bagi pengguna yang melakukan pelanggaran; " >> /etc/pesan
echo "Server by $namap ( $nhp )" >> /etc/pesan

echo "Banner /etc/pesan" >> /etc/ssh/sshd_config