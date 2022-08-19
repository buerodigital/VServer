#!/bin/bash
                                                                                                                                                                                                                   
clear                                                                                                                                                                                                              
                                                                                                                                                                                                                   
echo -e "=== Creating Folders for Bind-Volumes ==="
                                                                                                                                                                                                                   
mkdir /opt/apps.ideenrocker.com/vol_vhost
mkdir /opt/apps.ideenrocker.com/vol_certs
mkdir /opt/apps.ideenrocker.com/vol_conf
mkdir /opt/apps.ideenrocker.com/vol_dhparam
mkdir /opt/apps.ideenrocker.com/vol_html
                                                                                                                                                                                                                   
echo -e "=== Creating Proxy Network ==="
                                                                                                                                                                                                                   
docker network create --driver bridge net_proxy
                                                                                                                                                                                                                   
echo -e "=== Done ==="
