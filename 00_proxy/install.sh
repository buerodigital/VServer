#!/bin/bash

WF="$(dirname "$(readlink -e "$0")")"
clear
source $WF/../include.sh 

echo -e "${YEL}=== Installing NGINX-Proxy "$DOMAIN" ===${NC}"

echo -e "\n${GRE}=== Creating Bind-Volume Folders ===${NC}"
mkdir $WF/certs
mkdir $WF/conf
mkdir $WF/vhost
mkdir $WF/dhparam
mkdir $WF/html
echo -e "${GRE}=== Done ===${NC}"

echo -e "\n${GRE}=== Creating Proxy Network ===${NC}"
docker network create --driver bridge net_proxy
echo -e "${GRE}=== Done ===${NC}"

echo -e "\n${GRE}=== Creating YAML File and starting Container ===${NC}"
sed -i -e "s|WORKFOLDER|$WF|g" $WF/docker-compose.yml
docker-compose -f $WF/docker-compose.yml up -d
echo -e "${GRE}=== Done ===${NC}"

#echo -e "\n${GRE}=== Creating *** ===${NC}"
#echo -e "${GRE}=== Done ===${NC}"

echo -e "\n${YEL}=== Done ===${NC}\n"
read -n1 -rp "Press any key to continue" key
