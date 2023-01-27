#!/bin/bash

# asukoht, kuhu varundusfail luua
asukoht="/root/home_bcp"

# kaustade leidmine /home kaustast
kataloog=/home

# kodukausta liikumine, et varundatakse ainult kasutajate kataloogid, mitte /home kataloog ise
cd $kataloog
for failinimi in $(ls $kataloog); do
	if [ -f $failinimi ]; then
		echo "$failinimi on tavaline fail, ei varundata"
	else
		if [ -d $failinimi ] && [ $failinimi != "lost+found" ]; then
			echo "$failinimi on kaust, tehakse varukoopia asukohta $asukoht/$arhiivi_fail"
			arhiivi_fail="$(basename $failinimi)-$kuupaev.tar.gz"
			#kataloogi varundamine kasutades tari
			# arhviivi failinime loomine koos kuupäeva ja nimega
			kuupaev=$(date +"%d.%m.%y")
			tar -c -f $failinimi.$kuupaev.tar $failinimi/
			gzip $failinimi.$kuupaev.tar
			mv $failinimi.$kuupaev.tar.gz $asukoht

		fi
	fi
done

# varundamise lõpp
echo
echo "Varundamine on valmis"
date

# failide list ja nende suurused

ls -lh $asukoht
