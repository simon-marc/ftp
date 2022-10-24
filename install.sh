#./bin/bash

if [ $whoami !=root ]; then
	exit
fi

apt -y install proftpd
apt-get update ; apt get upgrade

service proftpd start
cp /etc/proftpd.proftpd.conf /etc/proftpd/proftpd.con.backup

hostaname -I | cut -f1 -d' '

mkdir -p /etc/proftpd/ssl
opeopenssl req -x509 -newkey rsa:1024 keyout /etc/ssl/private/proftpd-key.pem~ -out /etc/ssl/private/proftpd-rsa.pem -nodes -days 365
-subj 440 /etc/proftpd/ssl/proftpd-key.pem~
cat configTLS.txt >> /etc/proftpd/proftpd.conf

sudo service proftpd restart 

