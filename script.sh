#!/usr/bin/env bash
echo "########## Instalando Apache ##########"
yum install httpd -y

echo "########## Copiando Site Web ##########"
cp -r /vagrant/html/* /var/www/html/

echo "########## Iniciando Apache ##########"
systemctl enable httpd
systemctl start httpd
