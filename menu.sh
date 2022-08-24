#!/bin/bash

source include.sh

clear

funct_menu_1 () {
	echo -e "${PUR}****************************************${NC}"
	echo -e "${PUR}* Menü                         Seite 1 *${NC}"
	echo -e "${PUR}****************************************${NC}"
	echo -e "${PUR}* 00 - Punkt 0                         *${NC}"
	echo -e "${PUR}* 01 - Punkt 1                         *${NC}"
	echo -e "${PUR}* 02 - Punkt 2                         *${NC}"
	echo -e "${PUR}* 03 - Punkt 3                         *${NC}"
	echo -e "${PUR}* 04 - Punkt 4                         *${NC}"
	echo -e "${PUR}* 05 - Punkt 5                         *${NC}"
	echo -e "${PUR}* 06 - Punkt 6                         *${NC}"
	echo -e "${PUR}* 07 - Punkt 7                         *${NC}"
	echo -e "${PUR}* 08 - Punkt 8                         *${NC}"
	echo -e "${PUR}* 09 - Punkt 9                         *${NC}"
	echo -e "${PUR}****************************************${NC}"
	echo -e "${PUR}* < - zurück                   vor - > *${NC}"
	echo -e "${PUR}*             q  - Beenden             *${NC}"
	echo -e "${PUR}****************************************${NC}"

echo -en "\n${PUR}Enter a number: ${NC}"

read n1

  case $n1 in
    "0")
	echo "Hauptmenü 0"
	exit
 	;;
    "1")
	echo "Hauptmenü 1"
	exit
	;;
    "2")
	echo "Hauptmenü 2"
	exit
	;;
    "3")
	echo "Hauptmenü 3"
	exit
	;;
    "4")
	echo "Hauptmenü 4"
	exit
	;;
    "5")
	echo "Hauptmenü 5"
	exit
	;;
    "6")
	echo "Hauptmenü 6"
	exit
	;;
    "7")
	echo "Hauptmenü 7"
	exit
	;;
    "8")
	echo "Hauptmenü 8"
	exit
	;;
    "9")
	echo "Hauptmenü 9"
	exit
	;;
    "q")
	exit
	;;
    *)
	echo "Ungültige Eingabe - Bitte wiederholen"
	funct_main
	;;
  esac

}


funct_main
