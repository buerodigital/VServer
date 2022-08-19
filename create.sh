#!/bin/bash

# Bitte anpassen
DOMAIN="apps.ideenrocker.com"
SIAB_USER


# Farbedefinitionen
NC='\033[31;0m\'       # no colors or formatting
RED='\033[0;31;1m\'    # print text in bold red
PUR='\033[0;35;1m\'    # print text in bold purple
YEL='\033[0;33;1m\'    # print text in bold Yellow
GRA='\033[0;37;1m\'    # print text in bold Gray



# Hinweis auf Löschung aller Daten
clear

echo -e "${RED}=== Achtung!!! Alle Daten werden gelöscht!!! ===${NC}"
echo -e "${RED}=== Ggf. mit CTRL + C abbrechen ===${NC}"

COUNT=5
while [ $COUNT -gt 0 ]; do
  echo "${NC}$COUNT"
  let COUNT=COUNT-1
done

echo "${NC}GO!"

mkdir /opt/$DOMAIN
mkdir /opt/$DOMAIN/volumes



# Installation Proxy
clear
echo -e "${YEL}=== Installing NGINX-Proxy "$DOMAIN" ===${NC}"

echo -e "\n${GRA}=== Creating Bind-Volumes Folders ===${NC}"
mkdir /opt/$DOMAIN/volumes/proxy_certs
mkdir /opt/$DOMAIN/volumes/proxy_conf
mkdir /opt/$DOMAIN/volumes/proxy_vhost
mkdir /opt/$DOMAIN/volumes/proxy_dhparam
mkdir /opt/$DOMAIN/volumes/proxy_html
echo -e "${GRA}=== Done ===${NC}"

echo -e "\n${GRA}=== Creating Proxy Network ===${NC}"
docker network create --driver bridge net_proxy
echo -e "${GRA}=== Done ===${NC}"

echo -e "\n${GRA}=== Creating YAML File for Porxy and starting Container ===${NC}"
cp ./apps_compose.yml /opt/$DOMAIN/apps_compose.yml
sed -i -e 's/DOMAIN/'"$DOMAIN"'/g' /opt/$DOMAIN/apps_compose.yml
docker-compose -f /opt/$DOMAIN/apps_compose.yml up -d
echo -e "${GRA}=== Done ===${NC}"









