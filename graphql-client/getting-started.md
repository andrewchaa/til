# GraphQl Client

https://github.com/graphql-dotnet/graphql-client

> A GraphQL Client for .NET Standard

a quick example

```csharp
private const string UrlByDesignIdQuery = @"
      query($designId: ID!) {
        design(id: $designId) {
          __typename
          ... on Design {
            id
            images {
              __typename
              ... on SceneImages {
                images {
                  variants {
                    small {
                      url
                    }
                  }
                }
              }
            }
          }
        }
      }
    ";

var graphqlClient = new GraphQLHttpClient(new Uri(config.Value.BaseUrl), new NewtonsoftJsonSerializer());
graphqlClient.HttpClient.DefaultRequestHeaders.Add("auth-key", config.Value.ApiKey);

var request = new DesignApiGraphQlRequest
{
    Query = UrlByDesignIdQuery,
    Variables = new { designId },
    Headers = new Dictionary<string, string>
    {
        { "authorization", authHeader }
    }
};

var response = await _graphqlClient.SendQueryAsync<DesignResponse>(request);


```
