#!/bin/bash
## Install ISPConfig 3 on Debian 8/9 64Bits
## ISPConfig3 3 + Nginx + Debian 8/9 64Bits

apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y
	 
MY_IP=$(ip a s|sed -ne '/127.0.0.1/!{s/^[ \t]*inet[ \t]*\([0-9.]\+\)\/.*$/\1/p}' | tr '\n' ' ')

SERVER_SERVIDOR=$(whiptail --title "server name" --backtitle "ISPConfig" --inputbox "Configuration - servidor (Ex: isp)" --nocancel 10 50 3>&1 1>&2 2>&3)

SERVER_FQDN=$(whiptail --title "servidor.seudominio.com.br" --backtitle "ISPConfig" --inputbox "Server Name Ex: servidor.seudominio.com.br" --nocancel 10 50 3>&1 1>&2 2>&3)

SERVER_IP=$(whiptail --title "server ip" --backtitle "ISPConfig" --inputbox "Configuration - ip ($MY_IP)" --nocancel 10 50 3>&1 1>&2 2>&3)

echo "$SERVER_IP  $SERVER_FQDN  $SERVER_SERVIDOR" >>/etc/hosts


# Instalar o unzip e configurar a região (Locales para PT_BR UTF8)
apt-get install unzip 
dpkg-reconfigure locales

# 2 - Download do ISPConfig
cd /tmp/
wget --no-check-certificate https://github.com/servisys/ispconfig_setup/archive/master.zip
unzip master.zip 
cd ispconfig_setup-master/

#3 - Instalação do ISPConfig
./install.sh 

# Configurações solicitadas via instalação por script:
# Banco: mariadb
# Password: https://www.random.org/passwords/
# Apache (*)
# HHVM (Yes)
# Xcache (Yes)
# PhpMyadmin (Yes)
# MailServer (dovecot)
# Antivirus (Yes)
# Setup User Quota (Yes)
# IspConfig (Standard)
# JailKit (Yes)
# RoundCube (*)
# SSL Conf - (BR)/(RS)/(Cidade)/meusite/TI


## permições de usuario arquivo e pasta
# cd /var/www/condutorconsciente.com/web

# chown -R web1:client1 admin

# chown -R web1:client1 *













