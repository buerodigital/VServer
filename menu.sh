#!/bin/bash

source ~/Dokumente/GitHub/VServer/bash/include.sh

clear
PUR='\033[0;35;1m'

funct_menu_1 () {
clear
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
	echo -e "${PUR}*                              vor - > *${NC}"
	echo -e "${PUR}*             q  - Beenden             *${NC}"
	echo -e "${PUR}****************************************${NC}"

echo -en "\n${PUR}Enter a number: ${NC}"

read n1

  case $n1 in
    "00")
	echo "Hauptmenü 0"
	sleep 2
	funct_menu_1
 	;;
    "01")
	echo "Hauptmenü 1"
	sleep 2
	funct_menu_1
	;;
    "02")
	echo "Hauptmenü 2"
	sleep 2
	funct_menu_1
	;;
    "03")
	echo "Hauptmenü 3"
	sleep 2
	funct_menu_1
	;;
    "04")
	echo "Hauptmenü 4"
	sleep 2
	funct_menu_1
	;;
    "05")
	echo "Hauptmenü 5"
	sleep 2
	funct_menu_1
	;;
    "06")
	echo "Hauptmenü 6"
	sleep 2
	funct_menu_1
	;;
    "07")
	echo "Hauptmenü 7"
	sleep 2
	funct_menu_1
	;;
    "08")
	echo "Hauptmenü 8"
	sleep 2
	funct_menu_1
	;;
    "09")
	echo "Hauptmenü 9"
	sleep 2
	funct_menu_1
	;;
	">")
	echo "vor"
	funct_menu_2
	;;
    "q")
	exit
	;;
    *)
	echo "Ungültige Eingabe - Bitte wiederholen"
	sleep 2
	funct_menu_1
	;;
  esac

}

funct_menu_2 () {
clear

	echo -e "${PUR}****************************************${NC}"
	echo -e "${PUR}* Menü                         Seite 2 *${NC}"
	echo -e "${PUR}****************************************${NC}"
	echo -e "${PUR}* 10 - Punkt 0                         *${NC}"
	echo -e "${PUR}* 11 - Punkt 1                         *${NC}"
	echo -e "${PUR}* 12 - Punkt 2                         *${NC}"
	echo -e "${PUR}* 13 - Punkt 3                         *${NC}"
	echo -e "${PUR}* 14 - Punkt 4                         *${NC}"
	echo -e "${PUR}* 15 - Punkt 5                         *${NC}"
	echo -e "${PUR}* 16 - Punkt 6                         *${NC}"
	echo -e "${PUR}* 17 - Punkt 7                         *${NC}"
	echo -e "${PUR}* 18 - Punkt 8                         *${NC}"
	echo -e "${PUR}* 19 - Punkt 9                         *${NC}"
	echo -e "${PUR}****************************************${NC}"
	echo -e "${PUR}* < - zurück                           *${NC}"
	echo -e "${PUR}*             q  - Beenden             *${NC}"
	echo -e "${PUR}****************************************${NC}"

echo -en "\n${PUR}Enter a number: ${NC}"

read n1

  case $n1 in
    "10")
	echo "Hauptmenü 10"
	sleep 2
	funct_menu_2
 	;;
    "11")
	echo "Hauptmenü 11"
	sleep 2
	funct_menu_2
	;;
    "12")
	echo "Hauptmenü 12"
	sleep 2
	funct_menu_2
	;;
    "13")
	echo "Hauptmenü 13"
	sleep 2
	funct_menu_2
	;;
    "14")
	echo "Hauptmenü 14"
	sleep 2
	funct_menu_2
	;;
    "15")
	echo "Hauptmenü 15"
	sleep 2
	funct_menu_2
	;;
    "16")
	echo "Hauptmenü 16"
	sleep 2
	funct_menu_2
	;;
    "17")
	echo "Hauptmenü 17"
	sleep 2
	funct_menu_2
	;;
    "18")
	echo "Hauptmenü 18"
	sleep 2
	funct_menu_2
	;;
    "19")
	echo "Hauptmenü 19"
	sleep 2
	funct_menu_2
	;;
	"<")
	echo "zurück"
	funct_menu_1
	;;
    "q")
	exit
	;;
    *)
	echo "Ungültige Eingabe - Bitte wiederholen"
	sleep 2
	funct_menu_2
	;;
  esac

}

funct_menu_1
