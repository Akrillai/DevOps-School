#!/bin/bash
echo please type dest_ip:
read dest_ip


randomString1=$( echo $RANDOM | tr '[0-9]' '[a-z]' );
base64 /dev/urandom | head -c 1000000 > $randomString1.txt


randomString2=$( echo $RANDOM | tr '[0-9]' '[a-z]' );
base64 /dev/urandom | head -c 1000000 > $randomString2.txt


rsync -avz $randomString1.txt root@$dest_ip:/tmp
rsync -avz $randomString2.txt root@$dest_ip:/tmp


ssh $dest_ip "find /tmp -type f -name '*.txt' -mtime +7 -exec rm {} \;"
