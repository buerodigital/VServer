#!/bin/bash

WF="$(dirname "$(readlink -e "$0")")"
clear
source $WF/../include.sh 

echo -e "${YEL}=== Installing Onlyoffice "$OFFICE_SUBDOMAIN"."$DOMAIN"===${NC}"

echo -e "\n${GRE}=== Creating Random Keys ===${NC}"
sed -i -e "s|$OFFICE_SECRET|$(openssl rand -hex 32)|g" $WF/../include.sh
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
