#!/bin/bash

data=( `ps aux | grep -i dropbear | awk '{print $2}'`);
echo "-----------------------------------------";
echo "------------ Dropbear Login -------------";
echo "-----------------------------------------";

for PID in "${data[@]}"
do
	#echo "check $PID";
	NUM=`cat /var/log/auth.log | grep -i dropbear | grep -i "Password auth succeeded" | grep "dropbear\[$PID\]" | wc -l`;
	USER=`cat /var/log/auth.log | grep -i dropbear | grep -i "Password auth succeeded" | grep "dropbear\[$PID\]" | awk '{print $10}'`;
	IP=`cat /var/log/auth.log | grep -i dropbear | grep -i "Password auth succeeded" | grep "dropbear\[$PID\]" | awk '{print $12}'`;
	if [ $NUM -eq 1 ]; then
		echo "$PID - $USER - $IP";
	fi
done
echo "-----------------------------------------";

data=( `ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'`);

echo "------------ OpenSSH login --------------";
echo "-----------------------------------------";
for PID in "${data[@]}"
do
        #echo "check $PID";
        NUM=`cat /var/log/auth.log | grep -i sshd | grep -i "Accepted password for" | grep "sshd\[$PID\]" | wc -l`;
        USER=`cat /var/log/auth.log | grep -i sshd | grep -i "Accepted password for" | grep "sshd\[$PID\]" | awk '{print $9}'`;
        IP=`cat /var/log/auth.log | grep -i sshd | grep -i "Accepted password for" | grep "sshd\[$PID\]" | awk '{print $11}'`;
        if [ $NUM -eq 1 ]; then
                echo "$PID - $USER - $IP";
        fi
done

echo "-----------------------------------------";
echo "Untuk kill user log in, gunakan command  ";
echo "kill -9 (NomerPID)                       ";
echo "contoh : kill -9 28651 ";
echo "-----------------------------------------";
echo "-=[ Powered By : Gidhan Bagus Algary ]=- ";
echo "----------  www.algatekno.com  ----------";
echo "-----------------------------------------";
