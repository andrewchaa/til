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
