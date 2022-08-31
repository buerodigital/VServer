#!/bin/bash

WF="$(dirname "$(readlink -e "$0")")"
clear
source $WF/../include.sh 

echo -e "${YEL}=== Installing Shell in a Box ===${NC}"

#echo -e "\n${GRE}=== Creating Bind-Volume Folders ===${NC}"
#echo -e "${GRE}=== Done ===${NC}"

#echo -e "\n${GRE}=== Creating Proxy Network ===${NC}"
#echo -e "${GRE}=== Done ===${NC}"
echo $SHELL_USER
echo -e "\n${GRE}=== Creating YAML File and starting Container ===${NC}"
sed -i -e "s|SHELL_USER|$SHELL_USER|g" $WF/docker-compose.yml
sed -i -e "s|SHELL_PASS|$SHELL_PASS|g" $WF/docker-compose.yml
sed -i -e "s|SHELL_DOMAIN|$SHELL_SUBDOMAIN"."$DOMAIN|g" $WF/docker-compose.yml
sed -i -e "s|LETSENCRYPTEMAIL|$LETSENCRYPTEMAIL|g" $WF/docker-compose.yml
docker-compose -f $WF/docker-compose.yml up -d
echo -e "${GRE}=== Done ===${NC}"

#echo -e "\n${GRE}=== Creating *** ===${NC}"
#echo -e "${GRE}=== Done ===${NC}"

echo -e "\n${YEL}=== Done ===${NC}\n"
read -n1 -rp "Press any key to continue" key
