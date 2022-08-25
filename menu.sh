#!/bin/bash

source ./VServer/bash/include.sh
source ./VServer/bash/config.sh

funct_main () {
CHOICE=$(
whiptail --title "Main Menu" --menu "Make your choice" --cancel-button "Beenden" 16 100 9 \
	"1)" "System / Docker" \
	"2)" "Apps" \
	"==" "============================ " \
	"q)" "quit"  3>&2 2>&1 1>&3
)

case $CHOICE in
	"1)")
		funct_system
		;;
	"2)")
		funct_sub2
		;;
	"==")
		funct_main
		;;
	"q)") 
		exit
		;;
esac
}


funct_system () {
CHOICE=$(
whiptail --title "Submenu System / Docker" --menu "Make your choice" --cancel-button "Beenden" 16 100 9 \
	"1)" "Systemvorbereitung (Docker, Docker-Compose,... installieren)" \
	"2)" "Konfigurationsdaten für Grundinstallation bearbeiten" \
	"3)" "Backup erstellen" \
	"4)" "Backup einspielen" \
	"5)" "Docker Reset (Installation zurücksetzen ohne Backup)" \
	"6)" "System Update" \
	"==" "============================ " \
	"b)" "back" \
	"q)" "quit"  3>&2 2>&1 1>&3  
)

case $CHOICE in
	"1)")
		bash ./bash/requirements.sh
		funct_system
		;;
	"2)")
		DOMAIN2=$(whiptail --inputbox "Domainname Server (aktuell "$DOMAIN"):" 16 100 3>&1 1>&2 2>&3)
		sed -i -e "s|$DOMAIN|$DOMAIN2|g" ./VServer/bash/config.sh
		whiptail --msgbox "$DOMAIN2" 16 100
		;;
	"3)")
		result="Sub1_Do3"
		whiptail --msgbox "$result" 16 100
		funct_system
		;;
	"4)")
		result="Sub1_Do4"
		whiptail --msgbox "$result" 16 100
		funct_system
		;;
	"5)")
		result="Sub1_Do5"
		whiptail --msgbox "$result" 16 100
		funct_system
		;;
	"6)")
		bash ./bash/update.sh
		funct_system
		;;
	"b)") 
		funct_main
		;;
	"==") 
		funct_system
		;;
	"q)") 
		exit
		;;
esac
}


funct_sub2 () {
CHOICE=$(
whiptail --title "Submenu 2" --menu "Make your choice" --cancel-button "Beenden" 16 100 9 \
	"1)" "Sub 2_1" \
	"2)" "Sub 2 Doing 2" \
	"3)" "Sub 2 Doing 3" \
	"4)" "Sub 2 Doing 4" \
	"5)" "Sub 2 Doing 5" \
	"6)" "Sub 2 Doing 6" \
	"==" "============================ " \
	"b)" "back" \
	"q)" "quit"  3>&2 2>&1 1>&3  
)

case $CHOICE in
	"1)")
		funct_sub2_1
		;;
	"2)")
		result="Sub2_Do2"
		whiptail --msgbox "$result" 16 100
		funct_sub1
		;;
	"3)")
		result="Sub2_Do3"
		whiptail --msgbox "$result" 16 100
		funct_sub1
		;;
	"4)")
		result="Sub2_Do4"
		whiptail --msgbox "$result" 16 100
		funct_sub1
		;;
	"5)")
		result="Sub2_Do5"
		whiptail --msgbox "$result" 16 100
		funct_sub1
		;;
	"6)")
		result="Sub2_Do6"
		whiptail --msgbox "$result" 16 100
		funct_sub1
		;;
	"==") 
		funct_sub2
		;;
	"b)") 
		funct_main
		;;
	"q)") 
		exit
		;;
esac
}


funct_sub2_1 () {
CHOICE=$(
whiptail --title "Submenu 2_1" --menu "Make your choice" --cancel-button "Beenden" 16 100 9 \
	"1)" "Sub 2_1 Doing 1" \
	"2)" "Sub 2_1 Doing 2" \
	"3)" "Sub 2_1 Doing 3" \
	"4)" "Sub 2_1 Doing 4" \
	"5)" "Sub 2_1 Doing 5" \
	"6)" "Sub 2_1 Doing 6" \
	"==" "============================ " \
	"b)" "back" \
	"q)" "quit"  3>&2 2>&1 1>&3  
)

case $CHOICE in
	"1)")
		result="Sub2_1_Do1"
		whiptail --msgbox "$result" 16 100
		funct_sub1
		;;
	"2)")
		result="Sub2_1_Do2"
		whiptail --msgbox "$result" 16 100
		funct_sub1
		;;
	"3)")
		result="Sub2_1_Do3"
		whiptail --msgbox "$result" 16 100
		funct_sub1
		;;
	"4)")
		result="Sub2_1_Do4"
		whiptail --msgbox "$result" 16 100
		funct_sub1
		;;
	"5)")
		result="Sub2_1_Do5"
		whiptail --msgbox "$result" 16 100
		funct_sub1
		;;
	"6)")
		result="Sub2_1_Do6"
		whiptail --msgbox "$result" 16 100
		funct_sub1
		;;
	"==") 
		funct_sub2_1
		;;
	"b)") 
		funct_sub2
		;;
	"q)") 
		exit
		;;
esac
}


funct_main
