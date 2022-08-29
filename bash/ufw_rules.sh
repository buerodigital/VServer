#!/bin/bash

clear
source /opt/VServer/bash/include.sh

echo -en "${YEL}=== Updating Firewall rules ===${NC}"

echo -en "\n${GRE}=== Clearing current rules ===${NC}"
ufw disable
yes | ufw reset

echo -en "\n${GRE}=== Adding default Rules ===${NC}"
ufw default deny incoming
ufw default allow outgoing

echo -en "\n${GRE}=== Adding External Rules ===${NC}"
#Anpassen
ufw allow 22 comment "SSH"
ufw allow 80 comment "HTTP"
ufw allow 443 comment "HTTPS"
ufw allow 3478/tcp comment "COTURN"
ufw allow 3478/udp comment "COTURN"

echo -en "\n${GRE}=== Enabling Firewall ===${NC}"
yes | ufw enable
ufw status verbose

echo -en "\n${YEL}=== Done ===${NC}\n"
read -n1 -rp "Press any key to continue" key
