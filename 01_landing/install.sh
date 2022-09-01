#!/bin/bash

WF="$(dirname "$(readlink -e "$0")")"
clear
source $WF/../include.sh 

echo -e "${YEL}=== Installing Landingpage "$DOMAIN" ===${NC}"

#echo -e "\n${GRE}=== Creating Bind-Volume Folders ===${NC}"
#mkdir $WF/conf.d
#echo -e "${GRE}=== Done ===${NC}"

#echo -e "\n${GRE}=== Creating Proxy Network ===${NC}"
#echo -e "${GRE}=== Done ===${NC}"

echo -e "\n${GRE}=== Creating YAML File for Landing Page and starting Container ===${NC}"
sed -i -e "s|WORKFOLDER|$WF|g" $WF/docker-compose.yml
sed -i -e "s|DOMAIN|$DOMAIN|g" $WF/docker-compose.yml
sed -i -e "s|LETSENCRYPTEMAIL|$LETSENCRYPTEMAIL|g" $WF/docker-compose.yml
sed -i -e "s|REDIRECT_URL|$REDIRECT_URL|g" $WF/conf.d/default.conf
docker-compose -f $WF/docker-compose.yml up -d
echo -e "${GRE}=== Done ===${NC}"

#echo -e "\n${GRE}=== Creating Redirect ===${NC}"
  if [ "$REDIRECT_ACTIVE" = "1" ]; then
    sed -i -e "s|#REDIRECT_ACTIVE|      |g" $WF/docker-compose.yml
  fi
#echo -e "${GRE}=== Done ===${NC}"

echo -e "\n${YEL}=== Done ===${NC}\n"
read -n1 -rp "Press any key to continue" key
