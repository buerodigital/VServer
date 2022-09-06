#!/bin/bash

WF="$(dirname "$(readlink -e "$0")")"
clear
source $WF/include.sh 

echo -e "${YEL}=== Installing Nextcloud High Performance Signaling Server "$COTURN_SUBDOMAIN"."$DOMAIN"===${NC}"

echo -e "\n${GRE}=== Creating Keys for High Performance Signaling Server ===${NC}"
sed -i -e "s|$SIGNALING_STATIC_SECRET|$(openssl rand -hex 32)|g" $WF/../include.sh
sed -i -e "s|$SIGNALING_HASHKEY|$(openssl rand -base64 16)|g" $WF/../include.sh
sed -i -e "s|$SIGNALING_BLOCKKEY|$(openssl rand -base64 16)|g" $WF/../include.sh
sed -i -e "s|$NEXTCLOUD_SHARED_SECRET|$(openssl rand -hex 16)|g" $WF/../include.sh
sed -i -e "s|$NEXTCLOUD_API_KEY|$(openssl rand -base64 16)|g" $WF/../include.sh
echo -e "${GRE}=== Done ===${NC}"

echo -e "\n${GRE}=== Creating Bind-Volume Folders ===${NC}"
mkdir $WF/data
mkdir $WF/log
mkdir $WF/cache
mkdir $WF/public_files
mkdir $WF/fonts
mkdir $WF/postgresql_data
echo -e "${GRE}=== Done ===${NC}"

#echo -e "\n${GRE}=== Creating Proxy Network ===${NC}"
#echo -e "${GRE}=== Done ===${NC}"



echo -e "\n${GRE}=== Creating YAML File for Landing Page and starting Container ===${NC}"
sed -i -e "s|WORKFOLDER|$WF|g" $WF/docker-compose.yml
sed -i -e "s|OFFICE_DOMAIN|$OFFICE_SUBDOMAIN"."$DOMAIN|g" $WF/docker-compose.yml
sed -i -e "s|LETSENCRYPTEMAIL|$LETSENCRYPTEMAIL|g" $WF/docker-compose.yml
sed -i -e "s|OFFICE_SECRET|$JWTSECRET|g" $WF/docker-compose.yml
docker-compose -f $WF/docker-compose.yml up -d
echo -e "${GRE}=== Done ===${NC}"



#echo -e "\n${GRE}=== Creating *** ===${NC}"
#echo -e "${GRE}=== Done ===${NC}"

echo -e "\n${YEL}=== Done ===${NC}\n"
read -n1 -rp "Press any key to continue" key














clear
echo -e "${YEL}=== Installing Nextcloud Talk High Performance Backend coturn."$DOMAIN" ===${NC}"


echo -e "\n${GRA}=== Clonig Github-Repository ===${NC}"
mkdir $WORKFOLDER/04_coturn
cd $WORKFOLDER/04_coturn
git clone https://github.com/strukturag/nextcloud-spreed-signaling


echo -e "\n${GRA}=== Creating Bind-Volume Folders ===${NC}"
mkdir $WORKFOLDER/00_proxy

