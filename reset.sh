#!/bin/bash

WF="$(dirname "$(readlink -e "$0")")"
clear
source $WF/include.sh 

echo -e "${RED}=== Achtung!!! Alle Daten werden gelöscht!!! ===${NC}"

echo -e "\n${RED}=== Löschen bestätigen ===${NC}"                                                                                                                                                                                                      
read -p "Bitte geben Sie "JA" ein: " VAR_CONFIRM

if VAR_CONFIRM = "JA" then

	# Docker zurücksetzen
	docker stop $(docker ps -a -q)
	docker rm $(docker ps -a -q)
	docker rmi $(docker images -a -q)
	yes | docker system prune -a
	
	#Verzeichnis löschen
	rm -R $WF
else

	echo "\n${RED}=== Löschen abgebrochen ===${NC}"

fi

echo -e "\n${RED}=== Done ===${NC}\n"
read -n1 -rp "Press any key to continue" key


