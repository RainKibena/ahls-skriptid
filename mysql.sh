
MYSQL=$(dpkg-query -W -f='${Status}' mysql-server 2>/dev/null | grep -c 'ok installed')
if [ $MYSQL -eq 0 ]; then

	apt install -y debconf-utils
	apt install -y gnupg
	#installeerimise automatiseerimine läbi skripti, et ei peaks eraldi ise andmeid sisse trükkima
	export DEBIAN_FRONTEND="noninteractive"
	debconf-set-selections <<< "mysql-server mysql-server/root_password password qwerty"
	debconf-set-selections <<< "mysql-server mysql-server/root_password password qwerty"
	#mysql repositoorium installeeritakse manuaalselt, et ei tuleks ette prompt paigaldamise käigus
	apt-key adv --keyserver pgp.mit.edu --recv-keys 3A79BD29
	cat <<- EOF > /etc/apt/sources.list.d/mysql.list
	deb http://repo.mysql.com/apt/debian/ buster mysql-8.0
	EOF
	apt-get update
	apt-get install -y mysql-server

	systemctl start mysql
	echo "MySQL on paigaldatud"
elif [ $MYSQL -eq 1 ]; then

        echo "mysql server on juba olemas"
        mysql
fi
