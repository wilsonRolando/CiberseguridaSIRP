#!/bin/bash
#!/bin/sh
sudo chown -R 1000:1000 $PWD/ssl

docker stop elasticsearch elasticsearch2 elasticsearch3 kibana elastalert cortex thehive

#sudo chown -R 1000:1000 $PWD/volumes
#sudo rm -rfv $PWD/cortex/Cortex-Analyzers

sudo chown -R 1000:1000 $PWD/logstash

#sudo chown -R 1000:1000 $PWD/kibana

sudo chown -R 1000:1000 $PWD/elastAlert

sudo chown -R 1000:1000 $PWD/theHive

sudo chown -R 1000:1000 $PWD/cortex


docker start elasticsearch elasticsearch2 elasticsearch3 kibana elastalert cortex thehive