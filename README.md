# Rakendus serverite halduse automatiseerimine
Repositoorium ahls-skriptid sisaldab skripte, mis haldavad teenuste ja kontode lisamist shell skriptiga.
## apache.sh
apache.sh on skript mille käivitamisel see kontrollib kas apache2 on installitud ja kui ei ole siis installib selle.
### Skripti käivitamine
```
sh apache.sh
```

## kasutajad_failist.sh
kasutajad_failist on skript mis käivitamisel võtab antud failist nimed ja loob  neile kasutajad.
Fail kus on kasutajanimed tuleb spetsifitseerida esimese parameetrina.
### Skripti käivitamine
```
sh kasutajad_failist.sh #failinimi kus on kasutajanimed#
```

## kasutajate_haldus.sh
kasutajate_haldus.sh on skript mis käivitamisel võtab esimese sisestatud parameetri ja lisab selle nimega kasutaja.
### Skripti käivitamine
```
sh kasutajate_haldus.sh #kasutajanimi#
```

## mysql.sh
mysql.sh on skript mis kontrollib kas mysql on paigaldatud ja kui ei ole siis paigaldab selle.
### Skripti käivitamine
```
sh mysql.sh
```

## php.sh
php.sh on skript mis kontrollib kas php on paigaldatud ja kui ei ole siis paigaldab selle.
### Skripti käivitamine
```
sh php.sh
```

## pma.sh
pma.sh on skript mis kontrollib kas pma on paigaldatud ja kui ei ole siis paigaldab selle ja kõik vajalikud lisad.
### Skripti käivitamine
```
sh pma.sh
```

## wordpress.sh
wordpress.sh on skript mis loob mysql-i kasutaja ja andmebaasi, ning installib PHPMyAdmin-i.
### Skripti käivitamine
```
sh wordpress.sh
```
