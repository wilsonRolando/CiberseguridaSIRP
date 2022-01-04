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

docker stop elasticsearch1 elasticsearch2 elasticsearch3 kibana elastalert cortex thehive redis db misp misp-modules 

# sudo chown -R 1000:1000 $PWD/ssl
#sudo chmod -R 777 $PWD/ssl
# sudo chown -R 1000:1000 $PWD/kibana
sudo chmod -R 777 $PWD/kibana
# sudo chown -R 1000:1000 $PWD/logstash
sudo chmod -R 777 $PWD/logstash
# sudo chown -R 1000:1000 $PWD/kibana
sudo chmod -R 777 $PWD/kibana
# sudo chown -R 1000:1000 $PWD/elastAlert
sudo chmod -R 777 $PWD/elastAlert
# sudo chown -R 1000:1000 $PWD/theHive
sudo chmod -R 777 $PWD/theHive
# sudo chown -R 1000:1000 $PWD/cortex
sudo chmod -R 777 $PWD/cortex
# #sudo chown -R 1000:1000 $PWD/misp
#sudo chmod -R 777 $PWD/misp
# sudo chown -R 1000:1000 $PWD/volmysql
#sudo chmod -R 777 $PWD/volmysql

# #sudo chown -R 1000:1000 $PWD/redis_logst

echo starting.................
docker start elasticsearch1 elasticsearch2 elasticsearch3 kibana elastalert cortex thehive redis db misp misp-modules 

docker exec elastalert bash -c "elastalert-create-index"
