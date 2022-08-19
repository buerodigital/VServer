#!/bin/bash

source include.sh

# Hinweis auf Löschung aller Daten
clear
echo -e "${RED}=== Achtung!!! Alle Daten werden gelöscht!!! ==="
echo -e "=== Ggf. mit CTRL + C abbrechen ==="
COUNT=5
while [ $COUNT -gt 0 ]; do
  echo -e "$COUNT"
  let COUNT=COUNT-1
  sleep 1
done
echo -e "GO!${NC}"


# Docker zurücksetzen
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -a -q)
yes | docker system prune -a



# Updating Firewall Rules
clear
echo -e "${YEL}=== Updating Firewall Rules ===${NC}"
bash /opt/VServer/ufw_rules.sh
echo -e "${YEL}=== Done ===${NC}"
