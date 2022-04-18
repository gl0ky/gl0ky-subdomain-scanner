#!/bin/bash

if [ $1 ]
then

	if [ $2 ]
	then

		if [ $1 == "-l" ]
		then
			input=$2
			while IFS= read -r line
			do
        			echo "$line" > data/domains.txt
			done < "$input"
			sudo funtions/port_scan.sh $4

		elif [ $1 == "-d" ]
		then
        		echo "$2" > 1.tmp
			sed 's/,/\n/g' 1.tmp > 2.tmp
			rm 1.tmp
			cat 2.tmp > data/domains.txt
        		rm 2.tmp
			sudo functions/scan.sh $4

		elif [ $1 == "-h" ]
		then
        		echo "[*] Usage: sudo ./$0 [option] [user input]"
			echo "	-l path of file the with list of domains to scan."
			echo "	-d domains to scan (separed by coma)"

		else
			echo "[*] Usage: sudo ./$0 [option] [user input]"
        		echo "  -l path of file the with list of domains to scan."
        		echo "  -d domains to scan (separed by coma)"
		fi

	else
		echo "[*] Usage: sudo ./$0 [option] [user input]"
                echo "  -l path of file the with list of domains to scan."
               	echo "  -d domains to scan (separed by coma)"
	fi
else
	echo "[*] Usage: sudo ./$0 [option] [user input]"
	echo "  -l path of file the with list of domains to scan."
	echo "  -d domains to scan (separed by coma)"
fi
