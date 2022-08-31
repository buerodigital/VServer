
#!/bin/bash

source include.sh

# Installation Shell in a Box

clear
echo -e "${YEL}=== Installing Shell in a Box shell."$DOMAIN" ===${NC}"

echo -e "\n${GRA}=== Creating Bind-Volume Folders ===${NC}"
mkdir $WORKFOLDER/02_shell
echo -e "${GRA}=== Done ===${NC}"

echo -e "\n${GRA}=== Creating YAML File for Landing Page and starting Container ===${NC}"
cp /opt/VServer/02_shell_compose.yml $WORKFOLDER/02_shell/02_shell_compose.yml
sed -i -e "s|SIABUSER|$SIABUSER|g" $WORKFOLDER/02_shell/02_shell_compose.yml
sed -i -e "s|SIABPASSWORD|$SIABPASSWORD|g" $WORKFOLDER/02_shell/02_shell_compose.yml
sed -i -e "s|DOMAIN|$DOMAIN|g" $WORKFOLDER/02_shell/02_shell_compose.yml
sed -i -e "s|LETSENCRYPTEMAIL|$LETSENCRYPTEMAIL|g" $WORKFOLDER/02_shell/02_shell_compose.yml
docker-compose -f $WORKFOLDER/02_shell/02_shell_compose.yml build
echo -e "${GRA}=== Done ===${NC}"
