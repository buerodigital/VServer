#!/bin/bash

WF="$(dirname "$(readlink -e "$0")")"
clear
source $WF/include.sh 

echo -e "${YEL}=== Creating Random Keys for the Server Applications ===${NC}"

echo -e "\n${GRE}=== Creating Keys for OnlyOffice ===${NC}"
sed -i -e "s|$OFFICE_SECRET|$(openssl rand -hex 32)|g" $WF/include.sh

echo -e "\n${GRE}=== Creating Keys for High Performance Signaling Server ===${NC}"
sed -i -e "s|$SIGNALING_STATIC_SECRET|$(openssl rand -hex 32)|g" $WF/include.sh
sed -i -e "s|$SIGNALING_HASHKEY|$(openssl rand -base64 16)|g" $WF/include.sh
sed -i -e "s|$SIGNALING_BLOCKKEY|$(openssl rand -base64 16)|g" $WF/include.sh
sed -i -e "s|$NEXTCLOUD_SHARED_SECRET|$(openssl rand -hex 16)|g" $WF/include.sh
sed -i -e "s|$NEXTCLOUD_API_KEY|$(openssl rand -base64 16)|g" $WF/include.sh

echo -e "\n${YEL}=== Done ===${NC}\n"
read -n1 -rp "Press any key to continue" key
