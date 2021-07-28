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
