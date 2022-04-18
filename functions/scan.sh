
#!/bin/bash
archivo="data/domains.txt"
today=$(date +"%m-%d-%Y-%H:%M:%S")
mkdir -p "output/port_scan/$1-$today"
mkdir -p "output/full_scan/$1-$today"
while IFS= read -r linea
do
  sudo nmap -sS -Pn --min-rate 5000 -vvv -p- --open $linea -oG output/port_scan/"$1-$today"/"$linea.txt"
done < "$archivo"
while IFS= read -r linea
do
        ports="$(cat output/port_scan/$1-$today/$linea.txt | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
        sudo nmap -sS -vvv -sCV --min-rate 5000 -p$ports $linea --script=vulscan/vulscan.nse --script=http-enum -oN output/full_scan/"$1-$today"/"$linea.txt"
done < "data/domains.txt"
