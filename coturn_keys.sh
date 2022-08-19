#!/bin/bash

mkdir /root/signaling_keys 

echo "Creating Keys for Nextcloud Signaling Server" 
echo -e "=====\n"

#create a random hex key (STATIC_SECRET) for your nextcloud talk app and signaling server
openssl rand -hex 32 > /root/signaling_keys/static_secret.key 
chmod 600 /root/signaling_keys/static_secret.key

#and a hashkey
openssl rand -base64 16 > /root/signaling_keys/hashkey.key 
chmod 600 /root/signaling_keys/hashkey.key

#a blockkey
openssl rand -base64 16 > /root/signaling_keys/blockkey.key 
chmod 600 /root/signaling_keys/blockkey.key

#a Nextcloud SHARED_SECRET for Signaling
openssl rand -hex 16 > /root/signaling_keys/shared_secret.key 
chmod 600 /root/signaling_keys/shared_secret.key

#an API-KEY
openssl rand -base64 16 > /root/signaling_keys/api_key.key 
chmod 600 /root/signaling_keys/api_key.key

echo "Done"
echo -e "=====\n"
