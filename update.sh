#!/bin/bash

clear
source include.sh

echo -e "${YEL}=== System Update ===${NC}"

echo -e "\n${GRA}=== Updating ===${NC}"                                                                                                                                                                                                      
sudo apt update                                                                                                                                                                                                    

echo -e "\n${GRA}=== Upgrading ===${NC}"
sudo apt full-upgrade -y

echo -e "\n${GRA}=== Cleaning ===${NC}"
sudo apt autoremove -y
sudo apt autoclean -y

echo -e "\n${GRA}=== Rebooting if required ===${NC}"
[ -f /var/run/reboot-required ] && sudo reboot -f
                                                                                                                                                                                                                   
echo -e "\n${YEL}=== Done ===${NC}\n"
read -n1 -rp "Press any key to continue" key
