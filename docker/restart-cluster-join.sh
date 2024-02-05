export IP=192.168.1.164

docker-compose down
sleep 1
docker-compose up -d
sleep 1
echo "yes" | redis-cli --cluster create $IP:7001 $IP:7002 $IP:7003 $IP:7004 $IP:7005 $IP:7006 --cluster-replicas 1
sleep 1
redis-cli --cluster call $IP:7001 SET "foo" "123"