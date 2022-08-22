
#!/bin/bash

source include.sh

# Installation Redirect for nginx Proxy

clear
echo -e "${YEL}=== Installing Redirect for nginx Proxy "$DOMAIN" ===${NC}"

echo -e "\n${GRA}=== Creating Bind-Volume Folders ===${NC}"
mkdir $WORKFOLDER/05_redirect
echo -e "${GRA}=== Done ===${NC}"

echo -e "\n${GRA}=== Creating YAML File for Landing Page and starting Container ===${NC}"
cp /opt/VServer/05_redirect_compose.yml $WORKFOLDER/05_redirect/05_redirect_compose.yml
sed -i -e "s|DOMAIN|$DOMAIN|g" $WORKFOLDER/05_redirect/05_redirect_compose.yml
docker-compose -f $WORKFOLDER/05_redirect/05_redirect_compose.yml up -d
echo -e "${GRA}=== Done ===${NC}"
