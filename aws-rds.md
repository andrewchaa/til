# aws rds

1. [cloudformation for dbparametergroup](#cloudformation-for-dbparametergroup)

### cloudformation for dbparametergroup

```javascript
"Resources": {
  "DBParameterGroup": {
    "Type": "AWS::RDS::DBParameterGroup",
    "Properties": {
      "Description": "Parameter group for RDS instances",
      "Family": "aurora5.6",
      "Parameters": {
        "max_connections": 100
      }
    }
  },      

```


