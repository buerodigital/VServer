#!/bin/bash

source config.sh

echo $DOMAIN
read -p "Bitte eingeben: " DOMAIN2
sed -i -e "s|$DOMAIN|$DOMAIN2|g" config.sh
echo $DOMAIN2
