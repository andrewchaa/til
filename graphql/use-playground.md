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

Header

```json
{
  "api-auth-key": "xxxx"
}
```
