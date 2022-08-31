#!/bin/bash

WF="$(dirname "$(readlink -e "$0")")"
clear
source $WF/include.sh


#BAckup
# curlftpfs $FTP_USER:$FTP_PASS@$FTP_URL /opt/VServer_backup -o nonempty
# bak_date=$(date +'%Y_%m_%d_%H_%M')
# mkdir /opt/VServer_backup/$bak_date
# cp -R $WF/* /opt/VServer_backup/$bak_date/
# umount /opt/VServer_backup


funct_main () {
CHOICE=$(
whiptail --title "Hauptmenü" --menu "Bitte auswählen" --cancel-button "Beenden" 16 100 9 \
	"1)" "Systemupdate" \
	"2)" "Konfiguration bearbeiten" \
	"3)" "Proxy, Projekte und Repo löschen" \
	"4)" "Daten sichern" \
	"5)" "Daten wiederherstellen" \
	"6)" "Proxyserver" \
	"7)" "Shell in a Box" \
	"8)" "Only Office für Nextcloud" \
	3>&2 2>&1 1>&3
)

case $CHOICE in
	"1)")
		bash $WF/update.sh
		bash $WF/ufw_rules.sh
		funct_main
		;;
	"2)")
		nano $WF/include.sh
		funct_main
		;;
	"3)")
		bash $WF/reset.sh
		funct_main
		;;
	"4)")
		#funct_backup
		;;
	"5)")
		#funct_restore
		;;
	"6)")
		funct_00_proxy
		;;
	"7)")
		funct_02_shell
		;;
	"8)")
		funct_03_office
		;;
esac
}


funct_00_proxy () {
CHOICE=$(
whiptail --title "Proxyserver und Landingpage" --menu "Bitte auswählen" --cancel-button "Beenden" 16 100 9 \
	"1)" "Info" \
	"2)" "Install" \
	"3)" "Start" \
	"4)" "Stop" \
	"b)" "back" \
	3>&2 2>&1 1>&3  
)

case $CHOICE in
	"1)")
		whiptail --msgbox "$(cat $WF/00_proxy/README.md)" 16 100
		whiptail --msgbox "$(cat $WF/01_landing/README.md)" 16 100
		funct_00_proxy
		;;
	"2)")
		bash $WF/00_proxy/install.sh
		bash $WF/01_landing/install.sh
		whiptail --msgbox "Container wurde installiert und können jetzt gestartet werden." 16 100
		
        funct_00_proxy
		;;
	"3)")
		docker-compose -f $WF/01_landing/docker-compose.yml up -d
		docker-compose -f $WF/00_proxy/docker-compose.yml up -d
		whiptail --msgbox "Container wurden gestartet." 16 100
        funct_00_proxy
		;;
	"4)")
		docker-compose -f $WF/01_landing/docker-compose.yml down
		docker-compose -f $WF/00_proxy/docker-compose.yml down
		whiptail --msgbox "Container wurden gestoppt." 16 100
        funct_00_proxy
		;;
	"b)") 
		funct_main
		;;
esac
}


funct_02_shell () {
CHOICE=$(
whiptail --title "Shell in a box" --menu "Bitte auswählen" --cancel-button "Beenden" 16 100 9 \
	"1)" "Info" \
	"2)" "Install" \
	"3)" "Start" \
	"4)" "Stop" \
	"b)" "back" \
	3>&2 2>&1 1>&3  
)

case $CHOICE in
	"1)")
		whiptail --msgbox "$(cat $WF/02_shell/README.md)" 16 100
		funct_02_shell
		;;
	"2)")
		bash $WF/02_shell/install.sh
		whiptail --msgbox "Container wurde installiert und können jetzt gestartet werden." 16 100
        funct_02_shell
		;;
	"3)")
		docker-compose -f $WF/02_shell/docker-compose.yml up -d
		whiptail --msgbox "Container wurden gestartet." 16 100
        funct_02_shell
		;;
	"4)")
		docker-compose -f $WF/02_shell/docker-compose.yml down
		whiptail --msgbox "Container wurden gestoppt." 16 100
        funct_02_shell
		;;
	"b)") 
		funct_main
		;;
esac
}


funct_03_office () {
CHOICE=$(
whiptail --title "OnlyOffice for Nextcloud" --menu "Bitte auswählen" --cancel-button "Beenden" 16 100 9 \
	"1)" "Info" \
	"2)" "Install" \
	"3)" "Start" \
	"4)" "Stop" \
	"b)" "back" \
	3>&2 2>&1 1>&3  
)

case $CHOICE in
	"1)")
		whiptail --msgbox "$(cat $WF/03_office/README.md)" 16 100
		funct_03_office
		;;
	"2)")
		bash $WF/03_office/install.sh
		whiptail --msgbox "Container wurde installiert und können jetzt gestartet werden." 16 100
        funct_03_office
		;;
	"3)")
		docker-compose -f $WF/03_office/docker-compose.yml up -d
		whiptail --msgbox "Container wurden gestartet." 16 100
        funct_03_office
		;;
	"4)")
		docker-compose -f $WF/03_office/docker-compose.yml down
		whiptail --msgbox "Container wurden gestoppt." 16 100
        funct_03_office
		;;
	"b)") 
		funct_main
		;;
esac
}





funct_main
