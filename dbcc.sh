#!/bin/sh

sudo docker network create --subnet=172.23.86.0/24 postgres-postgresql.test302

docker run -d --name clustercontrol \
--network postgres-postgresql.test302 \
--ip 172.23.86.224 \
-h clustercontrol \
-p 5000:80 \
-p 5001:443 \
-v /storage/clustercontrol/cmon.d:/etc/cmon.d \
-v /storage/clustercontrol/datadir:/var/lib/mysql \
-v /storage/clustercontrol/sshkey:/root/.ssh \
-v /storage/clustercontrol/cmonlib:/var/lib/cmon \
-v /storage/clustercontrol/backups:/root/backups \
severalnines/clustercontrol
