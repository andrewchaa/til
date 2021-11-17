# Using GraphQL Playground

There is [a desktop app](https://github.com/graphql/graphql-playground). 

```graphql
query($input: OrdersByPostcodeInput!) {
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
