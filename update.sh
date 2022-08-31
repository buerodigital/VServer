#!/bin/bash

WF="$(dirname "$(readlink -e "$0")")"
clear
source $WF/include.sh 

echo -e "${YEL}=== System Update ===${NC}"

echo -e "\n${GRE}=== Updating ===${NC}"
apt update

echo -e "\n${GRE}=== Upgrading ===${NC}"
apt full-upgrade -y

echo -e "\n${GRE}=== Cleaning ===${NC}"
apt autoremove -y
apt autoclean -y

echo -e "\n${GRE}=== Rebooting if required ===${NC}"
[ -f /var/run/reboot-required ] && reboot -f

echo -e "\n${YEL}=== Done ===${NC}\n"
read -n1 -rp "Press any key to continue" key
