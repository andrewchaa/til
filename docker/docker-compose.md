# docker-compose up / down

### commands 

* `docker-compose up` will install and launch the docker images.
* `docker-compose down` tears down all the resources you created by `docker-compose up`

### single host

Basically, it shares the same host. One caveat is you can't use `localhost` still. You have to specify the host name.

```yaml
  accountapi:
    image: form3tech/interview-accountapi:v1.0.0-4-g63cf8434
    restart: on-failure
    hostname: accountapi
    depends_on:
      - postgresql
      - vault

```

```go
func NewClient() *Client {
	return &Client{
		HttpClient: &http.Client{
			Timeout: 5 * time.Minute,
		},
		baseUrl: "http://accountapi:8080/v1",
	}
}

```
