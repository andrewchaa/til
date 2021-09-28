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
```
