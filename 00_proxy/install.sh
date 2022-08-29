#!/bin/bash

clear
source /opt/VServer/bash/include.sh

echo -e "${YEL}=== Installing NGINX-Proxy "$DOMAIN" ===${NC}"

echo -e "\n${GRA}=== Creating Bind-Volume Folders ===${NC}"
mkdir /opt/VServer/00_proxy/certs
mkdir /opt/VServer/00_proxy/conf
mkdir /opt/VServer/00_proxy/vhost
mkdir /opt/VServer/00_proxy/dhparam
mkdir /opt/VServer/00_proxy/html
echo -e "${GRA}=== Done ===${NC}"

echo -e "\n${GRA}=== Creating Proxy Network ===${NC}"
docker network create --driver bridge net_proxy
echo -e "${GRA}=== Done ===${NC}"

echo -e "\n${GRA}=== Creating YAML File and starting Container ===${NC}"
docker-compose -f /opt/VServer/00_proxy/docker-compose.yml up -d
echo -e "${GRA}=== Done ===${NC}"

#echo -e "\n${GRA}=== Creating *** ===${NC}"
#echo -e "${GRA}=== Done ===${NC}"


