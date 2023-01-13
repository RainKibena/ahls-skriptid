#!/bin/bash

#Mysql andmebaasi, kasutaja ja kasutajaõiguste seadistamine root kasutajana:

mysql --user="root" --password="qwerty" --execute="create database wpdatabase;
create user wpuser@localhost identified by 'Passw0rd!';
grant all privileges on wpdatabase.* to wpuser@localhost;
flush privileges;
exit"

#wordpressi kausta loomine ja paigaldamine

mkdir /var/www/html/wordpress
wget -P /root/ https://wordpress.org/latest.tar.gz
tar xzvf /root/latest.tar.gz -C /var/www/html
cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

#wordpressi konfiguratsiooni faili muutmine

sed -i "s/database_name_here/wpdatabase/g" /var/www/html/wordpress/wp-config.php
sed -i "s/username_here/wpuser/g" /var/www/html/wordpress/wp-config.php
sed -i "s/password_here/Passw0rd!/g" /var/www/html/wordpress/wp-config.php

