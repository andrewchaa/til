# aws rds

* [cloudformation for dbparametergroup](#cloudformation-for-dbparametergroup)
* [db size in mb](#db-size-in-mb)

### db size in mb

```sql
SELECT table_schema "restaurantevents",
        ROUND(SUM(data_length + index_length) / 1024 / 1024, 1) "DB Size in MB"
FROM information_schema.tables
GROUP BY table_schema;

```

### cloudformation for dbparametergroup

```javascript

"Parameters": {
  "MaxConnection": {
    "Type": "Number",
    "Description" : "Set max connection limit for the db instance"
  }
}

"Resources": {
  "DBParameterGroup": {
    "Type": "AWS::RDS::DBParameterGroup",
    "Properties": {
      "Description": "Parameter group for Restaurant RDS instances",
      "Family": "aurora5.6",
      "Parameters": {
        "max_connections": { "Ref": "MaxConnection" }
      }
    }
  }
}

```

```yml
---
:parameters:
 :MaxConnection: 100
 
```
