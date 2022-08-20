#!/bin/bash

source include.sh

TEST="$(openssl rand -hex 32)"
$TEST >> ./04_coturn_keys.txt

clear
echo -e "${YEL}=== Generating Keys for Nextcloud Signaling Server ===${NC}"


#create a random hex key (STATIC_SECRET) for your nextcloud talk app and signaling server
echo -e "\n${GRA}=== Creating a random hex key (STATIC_SECRET) for your nextcloud talk app and signaling server ===${NC}"
echo -e "#STATIC_SECRET " >> ./04_coturn_keys.txt
STATIC_SECRET="$(openssl rand -hex 32)" 
echo "$STATIC_SECRET" >> ./04_coturn_keys.txt
echo -e "\n" >> ./04_coturn_keys.txt
sleep 1
echo -e "${GRA}=== Done ===${NC}"


#and a hashkey
echo -e "\n${GRA}=== #and a hashkey ===${NC}"
echo -e "#HASHKEY " >> ./04_coturn_keys.txt
HASHKEY="$(openssl rand -base64 16)" 
echo "$HASHKEY" >> ./04_coturn_keys.txt
echo -e "\n" >> ./04_coturn_keys.txt
sleep 1
echo -e "${GRA}=== Done ===${NC}"


#and a blockkey
echo -e "\n${GRA}=== #and a blockkey ===${NC}"
echo -e "#BLOCKKEY " >> ./04_coturn_keys.txt
BLOCKKEY="$(openssl rand -base64 16)" 
echo $BLOCKKEY >> ./04_coturn_keys.txt
echo -e "\n" >> ./04_coturn_keys.txt
sleep 1
echo -e "${GRA}=== Done ===${NC}"


#and a Nextcloud SHARED_SECRET for Signaling
echo -e "\n${GRA}=== #and a Nextcloud SHARED_SECRET for Signaling ===${NC}"
echo -e "#SHARED_SECRET " >> ./04_coturn_keys.txt
SHARED_SECRET="$(openssl rand -hex 16)" 
echo $SHARED_SECRET >> ./04_coturn_keys.txt
echo -e "\n" >> ./04_coturn_keys.txt
sleep 1
echo -e "${GRA}=== Done ===${NC}"


#and an API-KEY
echo -e "\n${GRA}=== #and an API-KEY ===${NC}"
echo -e "#API_KEY " >> ./04_coturn_keys.txt
API_KEY="$(openssl rand -base64 16)" 
echo $API_KEY >> ./04_coturn_keys.txt
echo -e "\n" >> ./04_coturn_keys.txt
sleep 1
echo -e "${GRA}=== Done ===${NC}"


# Installation Proxy
clear
echo -e "${YEL}=== Installing Nextcloud Talk High Performance Backend coturn."$DOMAIN" ===${NC}"


echo -e "\n${GRA}=== Clonig Github-Repository ===${NC}"
mkdir $WORKFOLDER/04_coturn
cd $WORKFOLDER/04_coturn
git clone https://github.com/strukturag/nextcloud-spreed-signaling


echo -e "\n${GRA}=== Creating Bind-Volume Folders ===${NC}"
mkdir $WORKFOLDER/00_proxy

