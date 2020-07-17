#!/bin/sh

docker run -d --name clustercontrol \
--network host \
--ip 34.67.142.38 \
-h clustercontrol \
-p 5000:80 \
-p 5001:443 \
-v /storage/clustercontrol/cmon.d:/etc/cmon.d \
-v /storage/clustercontrol/datadir:/var/lib/mysql \
-v /storage/clustercontrol/sshkey:/root/.ssh \
-v /storage/clustercontrol/cmonlib:/var/lib/cmon \
-v /storage/clustercontrol/backups:/root/backups \
severalnines/clustercontrol
