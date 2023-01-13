#!/bin/bash

if -ne 1 ]; then
	echo "Kasutusjuhend: $0 failinimi"
else
	failinimi=$1
	if [ -f $failinimi -a -r $failinimi ]; then
		echo "fail on korras"
		for nimi in $(cat $failinimi)
		do
	sh kasutajate_haldus.sh $nimi
	done
	else
		echo "probleem failiga $failinimi"
	fi
fi 
