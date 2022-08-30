#!/bin/bash

WF="$(dirname "$(readlink -e "$0")")"
clear
source $WF/include.sh 

echo -e "${YEL}=== Setting up Docker Environment ===${NC}"

echo -e "\n${GRE}=== Installing required Software ===${NC}"
sudo apt-get install docker docker-compose git curlftpfs ufw  

echo -e "\n${GRE}=== Creating Backup Folder ===${NC}"
sudo mkdir /opt/VServer_backup

echo -e "\n${GRE}=== Updating Firewall Rules ===${NC}"
bash /opt/VServer/bash/ufw_rules.sh


echo -e "\n${YEL}=== Done ===${NC}\n"
read -n1 -rp "Press any key to continue" key

