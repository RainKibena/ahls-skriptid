#!/bin/bash
if [ $# -ne 1 ]; then
	echo "Kasutusjuhend: $0 kasutajanimi"
else
	kasutajanimi=$1
	/sbin/useradd $kasutajanimi -m -s /bin/bash

	if [ $? -eq 0 ]; then
		echo "Kasutaja nimega $kasutajanimi on lisatud süsteemi"
		cat /etc/passwd | grep $kasutajanimi
		ls -la /home/$kasutajanimi
	else
		echo "probleem kasutaja $kasutajanimi lisamisega"
		echo "probleemi kood on $?"
	fi
fi
