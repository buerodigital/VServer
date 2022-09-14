#!/bin/bash

WF="$(dirname "$(readlink -e "$0")")"
clear
source $WF/../include.sh 

echo -e "${YEL}=== Installing Nextcloud High Performance Signaling Server "$COTURN_SUBDOMAIN"."$DOMAIN"===${NC}"

echo -e "\n${GRE}=== Creating Random Keys ===${NC}"
sed -i -e "s|$SIGNALING_STATIC_SECRET|$(openssl rand -hex 32)|g" $WF/../include.sh
sed -i -e "s|$SIGNALING_HASHKEY|$(openssl rand -base64 16)|g" $WF/../include.sh
sed -i -e "s|$SIGNALING_BLOCKKEY|$(openssl rand -base64 16)|g" $WF/../include.sh
sed -i -e "s|$NEXTCLOUD_SHARED_SECRET1|$(openssl rand -hex 16)|g" $WF/../include.sh
sed -i -e "s|$NEXTCLOUD_API_KEY|$(openssl rand -base64 16)|g" $WF/../include.sh
echo -e "${GRE}=== Done ===${NC}"

echo -e "\n${GRE}=== Cloning Git Repository ===${NC}"
git clone https://github.com/strukturag/nextcloud-spreed-signaling $WF && cd nextcloud-spreed-signaling
echo -e "${GRE}=== Done ===${NC}"

#echo -e "\n${GRE}=== Creating Bind-Volume Folders ===${NC}"
#echo -e "${GRE}=== Done ===${NC}"

#echo -e "\n${GRE}=== Creating Proxy Network ===${NC}"
#echo -e "${GRE}=== Done ===${NC}"


echo -e "\n${GRE}=== Creating YAML File for Landing Page ===${NC}"
sed -i -e "s|WORKFOLDER|$WF|g" $WF/docker-compose.yml
sed -i -e "s|COTURN_DOMAIN|$COTURN_SUBDOMAIN"."$DOMAIN|g" $WF/docker-compose.yml
sed -i -e "s|SIGNALING_STATIC_SECRET|$SIGNALING_STATIC_SECRET|g" $WF/docker-compose.yml
echo -e "${GRE}=== Done ===${NC}"


#echo -e "\n${GRE}=== Creating server.conf for Nextcloud High Performance Signaling Server ===${NC}"
sed -i -e "s|SIGNALING_HASHKEY|$SIGNALING_HASHKEY|g" $WF/server.conf
sed -i -e "s|SIGNALING_BLOCKKEY|$SIGNALING_BLOCKKEY|g" $WF/server.conf
sed -i -e "s|COTURN_BACKEND1|$COTURN_BACKEND1|g" $WF/server.conf
sed -i -e "s|NEXTCLOUD_SHARED_SECRET1|$NEXTCLOUD_SHARED_SECRET1|g" $WF/server.conf
sed -i -e "s|NEXTCLOUD_API_KEY|$NEXTCLOUD_API_KEY|g" $WF/server.conf
sed -i -e "s|SIGNALING_STATIC_SECRET|$SIGNALING_STATIC_SECRET|g" $WF/server.conf
chmod 664 $WF/server.conf
#echo -e "${GRE}=== Done ===${NC}"

echo -e "\n${GRE}=== Building and run Images ===${NC}"
docker-compose -f $WF/docker-compose.yml build
docker-compose -f $WF/docker-compose.yml up -d
echo -e "${GRE}=== Done ===${NC}"


echo -e "\n${YEL}=== Done ===${NC}\n"
read -n1 -rp "Press any key to continue" key








