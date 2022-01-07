#!/bin/bash
#!/bin/sh

sudo echo stoping ................

#elasticsearch
if ! grep -q 'vm.max_map_count' /etc/sysctl.conf; then
  sudo sh -c 'echo vm.max_map_count=262144 >>  /etc/sysctl.conf'
fi
sudo sysctl -w  vm.max_map_count=262144

#redis
if ! grep -q 'vm.overcommit_memory' /etc/sysctl.conf; then
  sudo sh -c 'echo vm.overcommit_memory=1 >>  /etc/sysctl.conf'
fi
sudo sysctl vm.overcommit_memory=1

# soluciona error de Permiso denegado RDM crontab => permiso de RW a todos 
docker exec redis bash -c "chmod 777 /etc/cron.d"

#docker stop elasticsearch1 elasticsearch2 elasticsearch3 kibana elastalert cortex thehive redis db misp misp-modules 
docker stop redis kibana
# sudo chown -R 1000:1000 $PWD/ssl
#sudo chmod -R 777 $PWD/ssl
# sudo chown -R 1000:1000 $PWD/kibana
sudo chmod -R 777 $PWD/kibana
# sudo chown -R 1000:1000 $PWD/logstash
#sudo chmod -R 777 $PWD/logstash

echo starting.................
#docker start elasticsearch1 elasticsearch2 elasticsearch3 kibana elastalert cortex thehive redis db misp misp-modules 
docker start redis kibana

docker exec elastalert bash -c "elastalert-create-index"
