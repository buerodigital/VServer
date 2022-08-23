#!/bin/bash

source include.sh

# Installation Onlyoffice

clear
echo -e "${YEL}=== Installing Onlyoffice office."$DOMAIN" ===${NC}"

echo -e "\n${GRA}=== Creating Bind-Volume Folders ===${NC}"
mkdir $WORKFOLDER/03_office
mkdir $WORKFOLDER/03_office/data
mkdir $WORKFOLDER/03_office/log
mkdir $WORKFOLDER/03_office/cache
mkdir $WORKFOLDER/03_office/public_files
mkdir $WORKFOLDER/03_office/fonts
mkdir $WORKFOLDER/03_office/postgresql_data
echo -e "${GRA}=== Done ===${NC}"


echo -e "\n${GRA}=== Creating YAML File for Landing Page and starting Container ===${NC}"
cp /opt/VServer/03_office_compose.yml $WORKFOLDER/03_office/03_office_compose.yml
sed -i -e "s|WORKFOLDER|$WORKFOLDER|g" $WORKFOLDER/03_office/03_office_compose.yml
sed -i -e "s|DOMAIN|$DOMAIN|g" $WORKFOLDER/03_office/03_office_compose.yml
sed -i -e "s|LETSENCRYPTEMAIL|$LETSENCRYPTEMAIL|g" $WORKFOLDER/03_office/03_office_compose.yml
sed -i -e "s|JWTSECRET|$JWTSECRET|g" $WORKFOLDER/03_office/03_office_compose.yml
sed -i -e "s|LETSENCRYPTEMAIL|$LETSENCRYPTEMAIL|g" $WORKFOLDER/03_office/03_office_compose.yml
docker-compose -f $WORKFOLDER/03_office/03_office_compose.yml up -d
echo -e "${GRA}=== Done ===${NC}"
