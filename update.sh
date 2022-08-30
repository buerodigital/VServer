#!/bin/bash

clear
source include.sh

echo -en "${YEL}=== System Update ===${NC}"

echo -en "\n${GRA}=== Updating ===${NC}"                                                                                                                                                                                                      
sudo apt update                                                                                                                                                                                                    

echo -en "\n${GRA}=== Upgrading ===${NC}"
sudo apt full-upgrade -y

echo -en "\n${GRA}=== Cleaning ===${NC}"
sudo apt autoremove -y
sudo apt autoclean -y

echo -en "\n${GRA}=== Rebooting if required ===${NC}"
[ -f /var/run/reboot-required ] && sudo reboot -f
                                                                                                                                                                                                                   
echo -en "\n${YEL}=== Done ===${NC}\n"
read -n1 -rp "Press any key to continue" key
