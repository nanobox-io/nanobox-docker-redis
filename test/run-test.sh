# Test redis after build
set -e
docker run --name=redis-test -d nanobox/redis
docker exec -it redis-test /bin/bash
curl localhost:5540/hooks/configure -d '{"logtap_host":"10.0.2.15:6361","uid":"cache1"}'
sleep 2
redis-cli set test success
redis-cli get test
redis-cli save
ls /data/var/db/redis/dump.rdb
exit
docker kill redis-test
