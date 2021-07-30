# Implementing Cursor-based Pagination

The format is like this.

```json
{
  "pagination": {
    "next_cursor": "WcdmoE=", 
    "limit": 20
  },
  "data": [],
}
```

* `next_cursor` is base64 encoded string of the resource identifier

```csharp
public async Task<(IEnumerable<Company> companies, long nextEntityId)> GetCompanies(long tenantId,
    SearchCompanyConditions conditions,
    int limit)
{
    var sqlCompanies = @$"
        SELECT TOP (@limit) *
          FROM Companies
         WHERE e.TenantId = @tenantId 
         {GetCompanyNameConditionStatement(conditions)}
         ORDER BY CompanyId DESC
";
    using var connection = new SqlConnection(connectionString);
    connection.Open();

    var results = (await connection.QueryAsync<Company>(sqlCompanies, new
    {
        tenantId,
        limit = limit + 1
    })).ToList();

    var skipCount = 1;
    var nextPageEntityId = results.Last().EntityId; 
    var isLastPage = results.Count < limit;
    if (isLastPage)
    {
        skipCount = 0;
        nextPageEntityId = 0;
    }

    var companies = results.SkipLast(skipCount);

    return (companies, nextPageEntityId);
}

```
