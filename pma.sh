#!/bin/bash
#phpmyadmin paigaldusskript

#kontrollime, kas phpmyadmin on juba installeeritud

PMA=$(dpkg-query -W -f='${Status}' phpmyadmin 2>/dev/null | grep -c 'ok installed')
#kui PMA väärtus võrdub 0-ga:
if [ $PMA -eq 0 ]; then
	#ok installed ei ole leitud
	#väljastatakse teade ja paigaldatakse pma
	echo "Phpmyadmin ja vajalike lisade paigaldamine"
	apt install apache2 php mariadb-server -y
	apt install php-{mbstring,zip,gd,xml,pear,gettext,cgi,mysql} libapache2-mod-php -y
	wget -P /root/ https://files.phpmyadmin.net/phpMyAdmin/5.2.0/phpMyAdmin-5.2.0-all-languages.tar.gz

	echo "Phpmyadmin kausta loomine ja sisu kopeerimine"
	mkdir /var/www/html/phpmyadmin
	tar xzf /root/phpMyAdmin-5.2.0-all-languages.tar.gz --strip-components=1 -C /var/www/html/phpmyadmin

	echo "Konfiguratsiooni faili loomine"
	cp /var/www/html/phpmyadmin/config{.sample,}.inc.php

	echo "Õiguste andmine konfiguratsiooni failile"
	chmod 660 /var/www/html/phpmyadmin/config.inc.php
	chown -R www-data:www-data /var/www/html/phpmyadmin

	echo "Apache teenuse restartimine"
	systemctl restart apache2

	echo "MariaDB serverisse ühendamine ja root kasutaja lubamine Phpmyadmini"
	mysql -u root -D mysql -e "UPDATE user SET plugin='mysql_native_password' WHERE User='root';FLUSH PRIVILEGES;"

	echo "Phpmyadmin on paigaldatud"
#kui PMA väärtus võrdub 1-ga:
elif [ $PMA -eq 1 ]; then
	#ok installed on leitud
	#pma on juba paigaldatud
	echo "Phpmyadmin on juba paigaldatud"
	#olemasolu kontrollimine
	which phpmyadmin
fi
