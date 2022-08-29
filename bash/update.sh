#!/bin/bash

clear

echo "${YEL}=== System Update ===${NC}"

echo "\n${GRA}=== Updating ===${NC}"                                                                                                                                                                                                      
sudo apt update                                                                                                                                                                                                    

echo "\n${GRA}=== Upgrading ===${NC}"
sudo apt full-upgrade -y

echo "\n${GRA}=== Cleaning ===${NC}"
sudo apt autoremove -y
sudo apt autoclean -y

echo "\n${GRA}=== Rebooting if required ===${NC}"
[ -f /var/run/reboot-required ] && sudo reboot -f
                                                                                                                                                                                                                   
echo "\n${YEL}=== Done ===${NC}\n"
read -n1 -rp "Press any key to continue" key
