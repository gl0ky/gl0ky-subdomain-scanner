#!/bin/bash


echo "[*] Updating System"
echo "==================================================================="
sudo apt-get update
echo "[*] Installing NMAP"
echo "==================================================================="
sudo apt-get install nmap
echo "[*] Installing NSE vuln script"
echo "==================================================================="
git clone https://github.com/scipag/vulscan scipag_vulscan
sudo ln -s `pwd`/scipag_vulscan /usr/share/nmap/scripts/vulscan
echo "[*] Installation Complete!"
echo "==================================================================="
