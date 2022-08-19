#!/bin/bash

# via 

# Bitte anpassen
DOMAIN="apps.ideenrocker.com"
SIABUSER="guest"
SIABPASSWORD="xyz"
LETSENCRYPTEMAIL="info@ideenrocker.com"
JWTSECRET=caioe


# Farbedefinitionen
NC='\033[31;0m'       # no colors or formatting
RED='\033[0;31;1m'    # print text in bold red
PUR='\033[0;35;1m'    # print text in bold purple
YEL='\033[0;33;1m'    # print text in bold Yellow
GRA='\033[0;37;1m'    # print text in bold Gray



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

docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
docker system prune -a

mkdir /opt/$DOMAIN
mkdir /opt/$DOMAIN/volumes
./ufw_rules.sh



# Installation Proxy
clear
echo -e "${YEL}=== Installing NGINX-Proxy "$DOMAIN" ===${NC}"

echo -e "\n${GRA}=== Creating Bind-Volume Folders ===${NC}"
mkdir /opt/$DOMAIN/volumes/proxy_certs
mkdir /opt/$DOMAIN/volumes/proxy_conf
mkdir /opt/$DOMAIN/volumes/proxy_vhost
mkdir /opt/$DOMAIN/volumes/proxy_dhparam
mkdir /opt/$DOMAIN/volumes/proxy_html
echo -e "${GRA}=== Done ===${NC}"

echo -e "\n${GRA}=== Creating Proxy Network ===${NC}"
docker network create --driver bridge net_proxy
echo -e "${GRA}=== Done ===${NC}"

echo -e "\n${GRA}=== Creating YAML File for Proxy and starting Container ===${NC}"
cp ./apps_compose.yml /opt/$DOMAIN/apps_compose.yml
sed -i -e 's/DOMAIN/'"$DOMAIN"'/g' /opt/$DOMAIN/apps_compose.yml
docker-compose -f /opt/$DOMAIN/apps_compose.yml up -d
echo -e "${GRA}=== Done ===${NC}"



# Installation Landingpage
clear
echo -e "${YEL}=== Installing Landingpage "$DOMAIN" ===${NC}"

echo -e "\n${GRA}=== Creating Bind-Volume Folders ===${NC}"
mkdir /opt/$DOMAIN/volumes/landing_html
echo -e "${GRA}=== Done ===${NC}"

echo -e "\n${GRA}=== Creating YAML File for Shell in a Box and starting Container ===${NC}"
cp ./landing_compose.yml /opt/$DOMAIN/landing_compose.yml
sed -i -e 's/DOMAIN/'"$DOMAIN"'/g' /opt/$DOMAIN/landing_compose.yml
sed -i -e 's/LETSENCRYPTEMAIL/'"$LETSENCRYPTEMAIL"'/g' /opt/$DOMAIN/landing_compose.yml
docker-compose -f /opt/$DOMAIN/landing_compose.yml up -d
echo -e "${GRA}=== Done ===${NC}"



# Installation Shell in a Box
clear
echo -e "${YEL}=== Installing Shell in a Box shell."$DOMAIN" ===${NC}"

echo -e "\n${GRA}=== Creating Bind-Volume Folders ===${NC}"
echo -e "${GRA}=== Done ===${NC}"

echo -e "\n${GRA}=== Creating YAML File for Shell in a Box and starting Container ===${NC}"
cp ./shell_compose.yml /opt/$DOMAIN/shell_compose.yml
sed -i -e 's/DOMAIN/'"$DOMAIN"'/g' /opt/$DOMAIN/shell_compose.yml
sed -i -e 's/SIABUSER/'"$SIABUSER"'/g' /opt/$DOMAIN/shell_compose.yml
sed -i -e 's/SIABPASSWORD/'"$SIABPASSWORD"'/g' /opt/$DOMAIN/shell_compose.yml
sed -i -e 's/LETSENCRYPTEMAIL/'"$LETSENCRYPTEMAIL"'/g' /opt/$DOMAIN/shell_compose.yml
docker-compose -f /opt/$DOMAIN/shell_compose.yml up -d
echo -e "${GRA}=== Done ===${NC}"



# Installation Onlyoffice
clear
echo -e "${YEL}=== Installing OnlyOffice office."$DOMAIN" ===${NC}"

echo -e "\n${GRA}=== Creating Bind-Volume Folders ===${NC}"
mkdir /opt/$DOMAIN/volumes/office_data
mkdir /opt/$DOMAIN/volumes/office_log
mkdir /opt/$DOMAIN/volumes/office_cache_files
mkdir /opt/$DOMAIN/volumes/office_public_files
mkdir /opt/$DOMAIN/volumes/office_fonts
mkdir /opt/$DOMAIN/volumes/office_postgresql_data
echo -e "${GRA}=== Done ===${NC}"

echo -e "\n${GRA}=== Cloning OnlyOffice Repository ===${NC}"
git clone https://github.com/ONLYOFFICE/Docker-DocumentServer /opt/$DOMAIN/
echo -e "${GRA}=== Done ===${NC}"

echo -e "\n${GRA}=== Creating YAML File for OnlyOffice and starting Container ===${NC}"
cp ./office_compose.yml /opt/$DOMAIN/office_compose.yml
sed -i -e 's/DOMAIN/'"$DOMAIN"'/g' /opt/$DOMAIN/office_compose.yml
sed -i -e 's/JWTSECRET/'"$JWTSECRET"'/g' /opt/$DOMAIN/office_compose.yml
sed -i -e 's/LETSENCRYPTEMAIL/'"$LETSENCRYPTEMAIL"'/g' /opt/$DOMAIN/office_compose.yml
rm /opt/$DOMAIN/Docker-DocumentServer/docker_compose.yml
mv ./office_compose.yml /opt/$DOMAIN/Docker-DocumentServer/docker_compose.yml
ln -s office_compose.yml /opt/$DOMAIN/Docker-DocumentServer/docker_compose.yml /opt/$DOMAIN/office_compose.yml
docker-compose -f /opt/$DOMAIN/office_compose.yml up -d
echo -e "${GRA}=== Done ===${NC}"




