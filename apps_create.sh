#!/bin/bash

# via "git clone https://github.com/buerodigital/VServer" clonen

# Bitte anpassen
WORKFOLDER="/opt/bash"
DOMAIN="apps.ideenrocker.com"
SIABUSER="guest"
SIABPASSWORD="xyz"
LETSENCRYPTEMAIL="info@ideenrocker.com"
JWTSECRET=caioe

if [ ! -d "$WORKFOLDER" ]; then
  mkdir $WORKFOLDER
fi


# Hinweis auf Löschung aller Daten
clear

echo -e "${RED}=== Achtung!!! Alle Daten werden gelöscht!!! ===${NC}"
echo -e "${RED}=== Ggf. mit CTRL + C abbrechen ===${NC}"

COUNT=5
while [ $COUNT -gt 0 ]; do
  echo -e "${NC}$COUNT"
  let COUNT=COUNT-1
done

echo -e "${NC}GO!"

docker stop $(docker ps -a -q)
docker system prune -a

rm -R /opt/*ideenrocker.com

mkdir /opt/$DOMAIN
mkdir /opt/$DOMAIN/volumes
bash $WORKFOLDER/ufw_rules.sh



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
cp $WORKFOLDER/apps_compose.yml /opt/$DOMAIN/apps_compose.yml
sed -i -e 's/DOMAIN/'"$DOMAIN"'/g' /opt/$DOMAIN/apps_compose.yml
docker-compose -f /opt/$DOMAIN/apps_compose.yml up -d --remove-orphan
echo -e "${GRA}=== Done ===${NC}"



# Installation Landingpage
clear
echo -e "${YEL}=== Installing Landingpage "$DOMAIN" ===${NC}"

echo -e "\n${GRA}=== Creating Bind-Volume Folders ===${NC}"
mkdir /opt/$DOMAIN/volumes/landing_html
echo -e "${GRA}=== Done ===${NC}"

echo -e "\n${GRA}=== Creating YAML File for Shell in a Box and starting Container ===${NC}"
cp $WORKFOLDER/landing_compose.yml /opt/$DOMAIN/landing_compose.yml
sed -i -e 's/DOMAIN/'"$DOMAIN"'/g' /opt/$DOMAIN/landing_compose.yml
sed -i -e 's/LETSENCRYPTEMAIL/'"$LETSENCRYPTEMAIL"'/g' /opt/$DOMAIN/landing_compose.yml
docker-compose -f /opt/$DOMAIN/landing_compose.yml up -d --remove-orphan
echo -e "${GRA}=== Done ===${NC}"



# Installation Shell in a Box
clear
echo -e "${YEL}=== Installing Shell in a Box shell."$DOMAIN" ===${NC}"

echo -e "\n${GRA}=== Creating Bind-Volume Folders ===${NC}"
echo -e "${GRA}=== Done ===${NC}"

echo -e "\n${GRA}=== Creating YAML File for Shell in a Box and starting Container ===${NC}"
cp $WORKFOLDER/shell_compose.yml /opt/$DOMAIN/shell_compose.yml
sed -i -e 's/DOMAIN/'"$DOMAIN"'/g' /opt/$DOMAIN/shell_compose.yml
sed -i -e 's/SIABUSER/'"$SIABUSER"'/g' /opt/$DOMAIN/shell_compose.yml
sed -i -e 's/SIABPASSWORD/'"$SIABPASSWORD"'/g' /opt/$DOMAIN/shell_compose.yml
sed -i -e 's/LETSENCRYPTEMAIL/'"$LETSENCRYPTEMAIL"'/g' /opt/$DOMAIN/shell_compose.yml
docker-compose -f /opt/$DOMAIN/shell_compose.yml up -d --remove-orphan
echo -e "${GRA}=== Done ===${NC}"

