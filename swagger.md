#### Resources

* swagger-node: https://github.com/swagger-api/swagger-node

#### Swagger-Node

To start the server, 
```
swagger project start
```

To edit the api documentation
```
swagger project edit
```

Run the both, to edit and to try the api operation.

##### to specify controller and method

```yaml
/exists:
  x-swagger-router-controller: exists
  get:
    operationId: get
```

use string instead of boolean, as response validation fails

```yaml
responses:
  '200':
    description: a string that represents a boolean value
    schema:
      type: string
```

##### to use the current server as host

remove host in swagger.yaml

```yaml
# during dev, should point to your local machine
# host: /
```
