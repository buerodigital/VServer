#!/bin/bash

clear
source /opt/VServer/bash/include.sh
source /opt/VServer/bash/config.sh

echo -en "${YEL}=== Installing Landingpage "$DOMAIN" ===${NC}"

#echo -en "\n${GRA}=== Creating Bind-Volume Folders ===${NC}"
#echo -en "${GRA}=== Done ===${NC}"

#echo -en "\n${GRA}=== Creating Proxy Network ===${NC}"
#echo -en "${GRA}=== Done ===${NC}"

echo -en "\n${GRA}=== Creating YAML File for Landing Page and starting Container ===${NC}"
sed -i -en "s|DOMAIN|$DOMAIN|g" /opt/VServer/01_landing/docker-compose.yml
sed -i -en "s|LETSENCRYPTEMAIL|$LETSENCRYPTEMAIL|g" /opt/VServer/01_landing/docker-compose.yml
docker-compose -f /opt/VServer/01_landing/docker-compose.yml up -d
echo -en "${GRA}=== Done ===${NC}"

#echo -en "\n${GRA}=== Creating *** ===${NC}"
#echo -en "${GRA}=== Done ===${NC}"
