# Docker Networks

* Bridge Network
* None Network
* Host Network

### Bridge Network

* the default network
* `docker run ubuntu`

### None Network

* no network at all
* `docker run ubuntu --network-none`


### Host Network

* share the same network
* you can't use the same port number twice as it's already taken
* `docker run ubuntu --network=host`


```
docker network ls

NETWORK ID     NAME      DRIVER    SCOPE
8adc28d1af5e   bridge    bridge    local
b70de08e4bed   host      host      local
897199270ec8   none      null      local

docker network inspect 89
```
