PHP=$(dpkg-query -W -f='${Status}' php 2>/dev/null | grep -c 'ok installed')

if [ $PHP -eq 0 ]; then
	echo "Paigaldame php ja vajalikud lisad"
	apt install php libapache2-mod-php php-mysql -y
	echo "php on paigaldatud"
elif [ $PHP -eq 1 ]; then
	echo "php on juba paigaldatud"
	which php
fi
