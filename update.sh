#!/bin/bash

clear
source include.sh

echo -e "${YEL}=== System Update ===${NC}"

echo -e "\n${GRE}=== Updating ===${NC}"                                                                                                                                                                                                      
sudo apt update                                                                                                                                                                                                    

echo -e "\n${GRE}=== Upgrading ===${NC}"
sudo apt full-upgrade -y

echo -e "\n${GRE}=== Cleaning ===${NC}"
sudo apt autoremove -y
sudo apt autoclean -y

echo -e "\n${GRE}=== Rebooting if required ===${NC}"
[ -f /var/run/reboot-required ] && sudo reboot -f
                                                                                                                                                                                                                   
echo -e "\n${YEL}=== Done ===${NC}\n"
read -n1 -rp "Press any key to continue" key
