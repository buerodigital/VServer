#!/bin/bash

clear
source /opt/VServer/bash/include.sh
source /opt/VServer/bash/config.sh

echo -e "${YEL}=== Installing Landingpage "$DOMAIN" ===${NC}"

#echo -e "\n${GRA}=== Creating Bind-Volume Folders ===${NC}"
#echo -e "${GRA}=== Done ===${NC}"

#echo -e "\n${GRA}=== Creating Proxy Network ===${NC}"
#echo -e "${GRA}=== Done ===${NC}"

echo -e "\n${GRA}=== Creating YAML File for Landing Page and starting Container ===${NC}"
sed -i -e "s|DOMAIN|$DOMAIN|g" $WORKFOLDER/01_landing/01_landing_compose.yml
sed -i -e "s|LETSENCRYPTEMAIL|$LETSENCRYPTEMAIL|g" $WORKFOLDER/01_landing/01_landing_compose.yml
docker-compose -f /opt/VServer/01_landing/docker-compose.yml up -d
echo -e "${GRA}=== Done ===${NC}"

#echo -e "\n${GRA}=== Creating *** ===${NC}"
#echo -e "${GRA}=== Done ===${NC}"
