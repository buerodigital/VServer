#!/bin/bash

source include.sh

clear                                                                                                                                                                                                              

echo -e "${PUR}=== Menü - Bitte treffen Sie Ihre Auswahl: ===\n${NC}"

echo -e "${PUR} S00 - Systemupdate ${NC}"
echo -e "${PUR} S01 - Einrichtung Grundsystem ${NC}"
echo -e "${PUR} S02 - Backup ${NC}"
echo -e "${PUR} S03 - Restore ${NC}"

echo -e "${PUR} 00 - Proxy ${NC}"
echo -e "${PUR} 01 - Landingpage ${NC}"
echo -e "${PUR} 02 - Shell ${NC}"
echo -e "${PUR} 03 - OnlyOffice fpr Nextcloud ${NC}"
echo -e "${PUR} 04 - High Performance Signaling Server for Nextcloud${NC}"
echo -e "${PUR} 05 - Redirect (statt 01 Landingpage)${NC}"


PS3="Select the operation: "

select opt in add subtract multiply divide quit; do

  case $opt in
    add)
      read -p "Enter the first number: " n1
      ;;
    subtract)
      read -p "Enter the first number: " n1
      ;;
    multiply)
      read -p "Enter the first number: " n1
      ;;
    divide)
      read -p "Enter the first number: " n1
      ;;
    quit)
      break
      ;;
    *) 
      echo "Invalid option $REPLY"
      ;;
  esac
done
