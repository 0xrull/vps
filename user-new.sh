#!/bin/bash

read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

IP=`curl icanhazip.com`
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "-=====[Account SSH]=====-"
echo -e "Host/IP: $IP" 
echo -e "Port OpenSSH: 22, 143"
echo -e "Port Dropbear: 80, 109, 110, 443"
echo -e "Port SquidProxy: 8080, 3128"
echo -e "Username: $Login "
echo -e "Password: $Pass"
echo -e "Aktif Sampai: $exp"
echo -e "-=====[Thanks]=====-"
echo -e "Visit : www.algatekno.com"
