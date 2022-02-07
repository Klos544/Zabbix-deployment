#!/bin/bash

cd /tmp
wget https://repo.zabbix.com/zabbix/5.4/debian/pool/main/z/zabbix-release/zabbix-release_5.4-1+debian11_all.deb
dpkg -i zabbix-release_5.4-1+debian11_all.deb
apt update
apt upgrade -y
apt install zabbix-agent -y
read -p "Quelle est l'adresse du serveur Zabbix ?" host
sed -i "s/Server=127.0.0.1/Server\=$host/" /etc/zabbix/zabbix_agentd.conf
systemctl restart zabbix-agent.service
