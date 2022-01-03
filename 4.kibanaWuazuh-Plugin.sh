#!/bin/bash

#Ejecuta kibana e instala plugin de wazuh 
docker exec kibana bash -c "cd /usr/share/kibana; 
/usr/share/kibana/bin/kibana-plugin install https://packages.wazuh.com/4.x/ui/kibana/wazuh_kibana-4.2.5_7.14.2-1.zip;
"


docker restart kibana
