# Using GraphQL Playground

There is [a desktop app](https://github.com/graphql/graphql-playground). 

```graphql
query($input: PostcodeInput!) {
    ordersByPostcode(input: $input) {
        items {
          id
          orderNumber
          deliveries {
            id
            status
          }
        }
        totalCount
    }
}
```

Headers

```json
{
  "api-auth-key": "xxxx"
}
```

Variables

```json
{
  "input": {
      "postcode": "EC4N 4SA",
      "offset": 0,
      "limit": 10
  }  
}

```

To create the query

Create the type in the schema

```javascript
input PostcodeInput {
    postcode: String!
    offset: Long
    limit: Long
}

```

Extend the query in the schema

```javascript
extend type Query {
  ...
  ordersByPostcode(input: postcodeInput!): Orders
}
```

Resolve the query

```javascript
public async searchOrdersByPostcode(
        postcode: string
    ): Promise<OrderPagedResponse> {

  return await this.get(
        `/orders`,
        {
            postcode
        },
        { headers: await this.getHeaders() }
    );
}

```
