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

```
