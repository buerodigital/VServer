#!/bin/bash

WF="$(dirname "$(readlink -e "$0")")"
clear
source $WF/../include.sh 

echo -e "${YEL}=== Installing Landingpage "$DOMAIN" ===${NC}"

#echo -e "\n${GRE}=== Creating Bind-Volume Folders ===${NC}"
#echo -e "${GRE}=== Done ===${NC}"

#echo -e "\n${GRE}=== Creating Proxy Network ===${NC}"
#echo -e "${GRE}=== Done ===${NC}"

echo -e "\n${GRE}=== Creating YAML File for Landing Page and starting Container ===${NC}"
sed -i -e "s|WORKFOLDER|$WF|g" $WF/docker-compose.yml
sed -i -e "s|DOMAIN|$DOMAIN|g" $WF/docker-compose.yml
sed -i -e "s|LETSENCRYPTEMAIL|$LETSENCRYPTEMAIL|g" $WF/docker-compose.yml
docker-compose -f $WF/docker-compose.yml up -d
echo -e "${GRE}=== Done ===${NC}"

#echo -e "\n${GRE}=== Creating *** ===${NC}"
#echo -e "${GRE}=== Done ===${NC}"

echo -e "\n${YEL}=== Done ===${NC}\n"
read -n1 -rp "Press any key to continue" key
