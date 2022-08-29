#!/bin/bash

clear

echo "${YEL}=== Updating Firewall rules ===${NC}"

echo "\n${GRA}=== Clearing current rules ===${NC}"
ufw disable
yes | ufw reset

echo "\n${GRA}=== Adding default Rules ===${NC}"
ufw default deny incoming
ufw default allow outgoing

echo "\n${GRA}=== Adding External Rules ===${NC}"
#Anpassen
ufw allow 22 comment "SSH"
ufw allow 80 comment "HTTP"
ufw allow 443 comment "HTTPS"
ufw allow 3478/tcp comment "COTURN"
ufw allow 3478/udp comment "COTURN"

echo "\n${GRA}=== Enabling Firewall ===${NC}"
yes | ufw enable
ufw status verbose

echo "\n${YEL}=== Done ===${NC}\n"
read -n1 -rp "Press any key to continue" key
