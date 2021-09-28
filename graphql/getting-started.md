# GraphQL getting started

### Schema

```javascript

type Merchandise {
  id: ID
  name: String
  description: String
  lastBid: Float
  lastBidUser: String
  imageUrl: String
}

type Query {
  hello: String!
  merchandises: [Merchandise]
  merchandise(id: ID): Merchandise
}

```

### Queries

```
# query all
{
  merchandises {
    id
    name
    description
    lastBid
    lastBidUser
    imageUrl
  }
}

# query a single
{
  merchandise(id: "a0001-11") {
    id
    name
    description
    lastBid
    lastBidUser
    imageUrl
  }
}

# query variables
query Merchandise($id: ID) {
  merchandise(id: $id) {
    id
    name
    description
    lastBid
    lastBidUser
    imageUrl
  }
}

{
  "id": "a0001-11"
}
```

### Send GraphQL query

```javascript
$scope.updateNow = (id, index) => {

    console.log("$scope.updatNow(" + id + ", " + index +  ") called");

    fetch("http://127.0.0.1:3000",
        {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                query: `
                query Merchandise($id: ID) {
                    merchandise(id: $id) {
                      id
                      name
                      description
                      lastBid
                      lastBidUser
                      imageUrl
                    }
                  }                                             
                `,
                /* add variables block here */  
                variables: {
                    id: id
                }
            })
        }
    )
    .then((res) => res.json())
    .then((result) => { 
        console.log(result.data);
        $scope.$apply( () => {
            $scope.inventory[index].lastBid = result.data.merchandise.lastBid ;
            $scope.inventory[index].lastBidUser = result.data.merchandise.lastBidUser;
        });
    })
    .catch((error) => console.log("Server responsed with an error: " + error) );        
```
