#!/bin/bash

source /opt/VServer/bash/config.sh

WF=/opt/VServer

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
		sed -i -e "s|$DOMAIN|$DOMAIN2|g" $WF/bash/config.sh
		
		LETSENCRYPTEMAIL2=$(whiptail --inputbox "email Adresse für Lets Encrypt (aktuell "$LETSENCRYPTEMAIL"):" 16 100 3>&1 1>&2 2>&3)
		sed -i -e "s|$LETSENCRYPTEMAIL|$LETSENCRYPTEMAIL2|g" $WF/bash/config.sh
		
		FTP_URL2=$(whiptail --inputbox "ftp Server für Backup (aktuell "$FTP_URL"):" 16 100 3>&1 1>&2 2>&3)
		sed -i -e "s|$FTP_URL|$FTP_URL2|g" $WF/bash/config.sh
		
		FTP_USER2=$(whiptail --inputbox "FTP User (aktuell "$FTP_USER"):" 16 100 3>&1 1>&2 2>&3)
		sed -i -e "s|$FTP_USER|$FTP_USER2|g" $WF/bash/config.sh
		
		FTP_PASS2=$(whiptail --inputbox "FTP Passwort (aktuell "$FTP_PASS"):" 16 100 3>&1 1>&2 2>&3)
		sed -i -e "s|$FTP_PASS|$FTP_PASS2|g" $WF/bash/config.sh
		
		whiptail --msgbox "$(cat $WF/bash/config.sh)" 16 100
		funct_system
		;;
		
	"3)")
		curlftpfs $FTP_USER:$FTP_PASS@$FTP_URL /opt/VServer_backup -o nonempty
		bak_date=$(date +'%Y_%m_%d_%H_%M')
		mkdir /opt/VServer_backup/$bak_date
		cp -R $WF/* /opt/VServer_backup/$bak_date/
		umount /opt/VServer_backup
		whiptail --msgbox "Done" 16 100
		funct_system
		;;
	"4)")
		result="Backup wiederherrstellen - Noch nicht implementiert"
		whiptail --msgbox "$result" 16 100
		funct_system
		;;
	"5)")
		bash ./bash/reset.sh
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


funct_apps () {
CHOICE=$(
whiptail --title "Docker Applications" --menu "Make your choice" --cancel-button "Beenden" 16 100 9 \
	"1)" "Proxy + Landing Page" \
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


funct_proxy () {
CHOICE=$(
whiptail --title "Submenu 2_1" --menu "Make your choice" --cancel-button "Beenden" 16 100 9 \
	"1)" "Info" \
	"2)" "Install" \
	"3)" "Stop" \
	"4)" "Start" \
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
		bash $WF/00_proxy/install.sh
		bash $WF/01_landing/install.sh
                funct_proxy ()
		;;
	"3)")
		docker-compose -f $WF/01_landing/docker-compose.yml down
		docker-compose -f $WF/00_proxy/docker-compose.yml down		
                funct_proxy ()
		;;
	"4)")
		docker-compose -f $WF/01_landing/docker-compose.yml up -d
		docker-compose -f $WF/00_proxy/docker-compose.yml down		
		funct_proxy ()
		;;

	"==") 
		funct_proxy ()
		;;
	"b)") 
		funct_apps
		;;
	"q)") 
		exit
		;;
esac
}


funct_main
