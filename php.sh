PHP=$(dpkg-query -W -f='${Status}' php 2>/dev/null | grep -c 'ok installed')
#PHP installimise skript
#Kontrollime kas PHP on juba instaleeritud
if [ $PHP -eq 0 ]; then'
	#Kui ei ole olemas annab teada ja paigaldab
	echo "Paigaldame php ja vajalikud lisad"
	apt install php libapache2-mod-php php-mysql -y
	echo "php on paigaldatud"
elif [ $PHP -eq 1 ]; then
	#Kui olemas annab teada ja ei tee midagi
	echo "php on juba paigaldatud"
	which php
fi
