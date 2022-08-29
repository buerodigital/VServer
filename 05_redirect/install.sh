
#!/bin/bash

source /opt/VServer/bash/include.sh
source /opt/VServer/05_redirect/config.sh

# Installation Redirect for nginx Proxy

clear
echo -e "${YEL}=== Installing Redirect for nginx Proxy "$DOMAIN" ===${NC}"

echo -e "\n${GRA}=== Creating YAML File for Landing Page and starting Container ===${NC}"
sed -i -e "s|host.domain.com|$REDIRECT_HOST|g" /opt/VServer/05_redirect/docker-compose.yml
sed -i -e "s|redirect.domain.com|$REDIRECT_DOMAIN|g" /opt/VServer/05_redirect/docker-compose.yml
docker-compose -f /opt/VServer/05_redirect/docker-compose.yml up -d
echo -e "${GRA}=== Done ===${NC}"
