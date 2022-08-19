#!/bin/bash

echo "Updating Firewall rules"
echo -e "=====\n"

echo "Clearing current rules"
echo -e "=====\n"
ufw disable                                                                                                                                                                                                        
yes | ufw reset

echo "Adding default Rules"
echo -e "=====\n"
ufw default deny incoming                                                                                                                                                                                          
ufw default allow outgoing                                                                                                                                                                                         

echo "Adding External Rules"
echo -e "=====\n"

#Anpassen
ufw allow 22 comment "SSH"
ufw allow 80 comment "HTTP"
ufw allow 443 comment "HTTPS"
ufw allow 3478/tcp comment "COTURN"
ufw allow 3478/udp comment "COTURN"

echo "Enabling Firewall"
echo -e "=====\n"
yes | ufw enable
ufw status verbose                                                                                                                                                                                                 

echo "Done"
echo -e "=====\n"
