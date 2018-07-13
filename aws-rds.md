# aws rds

1. [cloudformation for dbparametergroup](#cloudformation-for-dbparametergroup)

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
