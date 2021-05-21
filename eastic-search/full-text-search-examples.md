# Full text search examples

Examples of query I used


### Return everything

```json
GET /audits/_search
{
  "query": {
    "match_all": {}
  }
}

```

### Search with multiple values

```json
GET /audits/_search
{
  "query": {
    "bool": {
      "must": [{ 
          "terms": {
            "CorrelationIds": ["3de1eaae-a259-4bdc-8205-a942397621ef","dbb44cbd-64c9-4764-8b8f-a0d31604fb64"]
          }
        }]
    }
  }
}
```

