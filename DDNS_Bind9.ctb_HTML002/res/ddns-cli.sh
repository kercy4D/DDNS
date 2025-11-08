#!/bin/bash
#/etc/ddns-key/ddclient.key

DOMAIN="ansible.local"
SERVER="172.16.0.100"
HOSTNAME="$(hostname -f)"
IP="$(hostname -I)"
NS_KEY="/etc/ddns-key/ddclient.key"

nsupdate -k $NS_KEY -d <<EOF
server $SERVER
zone $DOMAIN
update add $HOSTNAME.$DOMAIN 300 A $IP
send
EOF
echo "Mise a jour DDNS pour $HOSTNAME.$DOMAIN -> $IP " 
