#!/bin/bash
#!/bin/sh
sudo chown -R 1000:1000 $PWD/ssl
echo stop................
docker stop elasticsearch1 elasticsearch2 elasticsearch3 kibana elastalert cortex thehive db misp misp-modules 
#sudo chown -R 1000:1000 $PWD/volumes
#sudo rm -rfv $PWD/cortex/Cortex-Analyzers


sudo chown -R 1000:1000 $PWD/kibana

sudo chown -R 1000:1000 $PWD/logstash

sudo chown -R 1000:1000 $PWD/kibana

sudo chown -R 1000:1000 $PWD/elastAlert

sudo chown -R 1000:1000 $PWD/theHive

sudo chown -R 1000:1000 $PWD/cortex

sudo chown -R 1000:1000 $PWD/misp


# sudo chown -R 1000:1000 $PWD/vol

# sudo chown -R 1000:1000 $PWD/vol/mysql
echo start.................
docker start elasticsearch1 elasticsearch2 elasticsearch3 kibana elastalert cortex thehive db misp misp-modules 