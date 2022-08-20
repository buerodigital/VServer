#!/bin/bash

source include.sh

# Installation Landingpage

clear
echo -e "${YEL}=== Installing Landingpage "$DOMAIN" ===${NC}"

echo -e "\n${GRA}=== Creating Bind-Volume Folders ===${NC}"
mkdir $WORKFOLDER/01_landing
mkdir $WORKFOLDER/01_landing/html
echo -e "${GRA}=== Done ===${NC}"

echo -e "\n${GRA}=== Creating YAML File for Landing Page and starting Container ===${NC}"
cp /opt/VServer/01_landing_compose.yml $WORKFOLDER/01_landing/01_landing_compose.yml
sed -i -e "s|WORKFOLDER|$WORKFOLDER|g" $WORKFOLDER/01_landing/01_landing_compose.yml
sed -i -e "s|DOMAIN|$DOMAIN|g" $WORKFOLDER/01_landing/01_landing_compose.yml
sed -i -e "s|LETSENCRYPTEMAIL|$LETSENCRYPTEMAIL|g" $WORKFOLDER/01_landing/01_landing_compose.yml
docker-compose -f $WORKFOLDER/01_landing/01_landing_compose.yml up -d
echo -e "${GRA}=== Done ===${NC}"

echo -e "\n${GRA}=== Creating index.html ===${NC}"
cp /opt_VServer/02_landing_index.html $WORKFOLDER/01_landing/html/index.html
echo -e "${GRA}=== Done ===${NC}"
