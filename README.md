# redis-cluster

Setting up redis cluster for development purpose: 6 nodes, 3 masters and 3 slaves.

Reference to original [repo](https://github.com/ChickenBenny/redis-cluster-docker).

Useful article on [redis cluster](https://medium.com/@stockholmux/redis-cluster-tutorial-7c3b6f9739b4).

Just run to start or restart cluster:

```shell
./restart-cluster-join.sh
```

To stop master node, run:

```shell
docker-compose down redis-3
```

To rejoin node to the cluster:

```shell
redis-cli -h $IP -p 7003 CLUSTER MEET $IP 7001
```

Connecting to redis node:

```shell
redis-cli -c -h $IP -p 7001
```

Checking cluster status:

```shell
192.168.1.164:7001> cluster nodes

59da6d783f2b15202039940c2e9a0730242fd302 192.168.1.164:7002@17002 master - 0 1706695010121 2 connected 5461-10922
e7ee5e24bef099cf11786ec7951ac3fbc4391f4a 192.168.1.164:7003@17003 master - 0 1706695010121 3 connected 10923-16383
62299f91a4ad7f032c98eede188bbef4049420c2 192.168.1.164:7004@17004 slave 59da6d783f2b15202039940c2e9a0730242fd302 0 1706695009090 2 connected
4081ddc9f3c76824bd26ddb0780f6ec95166ca6a 192.168.1.164:7005@17005 slave e7ee5e24bef099cf11786ec7951ac3fbc4391f4a 0 1706695009611 3 connected
c3c8ded10adc52f7e2dffb4b323dcc6a762e725c 192.168.1.164:7006@17006 slave ec188d105602b80828740c3ba1e41d2cbc4face8 0 1706695010000 1 connected
ec188d105602b80828740c3ba1e41d2cbc4face8 192.168.1.164:7001@17001 myself,master - 0 1706695009000 1 connected 0-5460
```
