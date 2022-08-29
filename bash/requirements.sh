#!/bin/bash
                                                                                                                                                                                                                   
clear
source /opt/VServer/bash/include.sh                                                                                                                                                                                                            

echo -e "=== Installing required Software ==="
sudo apt-get install docker docker-compose git curlftpfs ufw  

echo -e "=== Creating Backup Folder ==="
sudo mkdir /opt/VServer_backup

echo -e "=== Updating Firewall Rules ==="
bash /opt/VServer/bash/ufw_rules.sh
                                                                                                                                                                                                                   
echo -e "\n=== Done ==="

read -n1 -rp "Press any key to continue" key
