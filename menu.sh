#!/bin/bash

source include.sh

clear

funct_main () {
	echo -e "${PUR}****************************************${NC}"
	echo -e "${PUR}*              Hauptmenü               *${NC}"
	echo -e "${PUR}****************************************${NC}"
	echo -e "${PUR}* 0 - Punkt 0                          *${NC}"
	echo -e "${PUR}* 1 - Punkt 1                          *${NC}"
	echo -e "${PUR}* 2 - Punkt 2                          *${NC}"
	echo -e "${PUR}* 3 - Punkt 3                          *${NC}"
	echo -e "${PUR}* 4 - Punkt 4                          *${NC}"
	echo -e "${PUR}* 5 - Punkt 5                          *${NC}"
	echo -e "${PUR}* 6 - Punkt 6                          *${NC}"
	echo -e "${PUR}* 7 - Punkt 7                          *${NC}"
	echo -e "${PUR}* 8 - Punkt 8                          *${NC}"
	echo -e "${PUR}* 9 - Punkt 9                          *${NC}"
	echo -e "${PUR}****************************************${NC}"
	echo -e "${PUR}*                                      *${NC}"
	echo -e "${PUR}* q  - Beenden                         *${NC}"
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
