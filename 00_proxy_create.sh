#!/bin/bash

source include.sh

# Installation Proxy
clear
echo -e "${YEL}=== Installing NGINX-Proxy "$DOMAIN" ===${NC}"

echo -e "\n${GRA}=== Creating Bind-Volume Folders ===${NC}"
mkdir $WORKFOLDER/volumes/00_proxy_certs
mkdir $WORKFOLDER/volumes/00_proxy_conf
mkdir $WORKFOLDER/volumes/00_proxy_vhost
mkdir $WORKFOLDER/volumes/00_proxy_dhparam
mkdir $WORKFOLDER/volumes/00_proxy_html
echo -e "${GRA}=== Done ===${NC}"

echo -e "\n${GRA}=== Creating Proxy Network ===${NC}"
docker network create --driver bridge net_proxy
echo -e "${GRA}=== Done ===${NC}"

echo -e "\n${GRA}=== Creating YAML File for Proxy and starting Container ===${NC}"
cp /opt/VServer/00_proxy_compose.yml $WORKFOLDER/00_proxy_compose.yml
sed -i -e 's/WORKFOLDER/'"$WORKFOLDER"'/g' $WORKFOLDER/00_proxy_compose.yml
docker-compose -f $WORKFOLDER/00_proxy_compose.yml up -d --remove-orphan
echo -e "${GRA}=== Done ===${NC}"
