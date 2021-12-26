#!/bin/bash
#!/bin/sh

#elasticsearch
sudo sysctl -w  vm.max_map_count=262144

#redis
sudo sysctl vm.overcommit_memory=1


echo stop................
docker stop elasticsearch1 elasticsearch2 elasticsearch3 kibana elastalert cortex thehive redis db misp misp-modules 
#sudo chown -R 1000:1000 $PWD/volumes
#sudo rm -rfv $PWD/cortex/Cortex-Analyzers
sudo chown -R 1000:1000 $PWD/ssl

sudo chown -R 1000:1000 $PWD/kibana

sudo chown -R 1000:1000 $PWD/logstash

sudo chown -R 1000:1000 $PWD/kibana

sudo chown -R 1000:1000 $PWD/elastAlert

sudo chown -R 1000:1000 $PWD/theHive

sudo chown -R 1000:1000 $PWD/cortex

#sudo chown -R 1000:1000 $PWD/misp

sudo chown -R 1000:1000 $PWD/volmysql

#sudo chown -R 1000:1000 $PWD/redis_logst

echo start.................
docker start elasticsearch1 elasticsearch2 elasticsearch3 kibana elastalert cortex thehive redis db misp misp-modules 