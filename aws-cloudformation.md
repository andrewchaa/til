# cloud formation

* [set route 53 to point to cluster](#set-route-53-to-point-to-cluster)

### set route 53 to point to cluster

```javascript
"Resources": {
  "DBCluster": {
    "Type": "AWS::RDS::DBCluster",
    "Properties": {        
      "MasterUsername": {
        "Ref": "DBUsername"
      },
      "MasterUserPassword": {
        "Ref": "DBPassword"
      },
      "DBSubnetGroupName": {
        "Ref": "DBSubnetGroup"
      },
      "Engine": "aurora",
      "DatabaseName": {
        "Ref": "DBName"
      },
      "VpcSecurityGroupIds": [{ "Ref": "restauranteventsdbHostIndSg" }],
      "Port": "3306",
      "BackupRetentionPeriod": 1
    }
  },
  "DBInstance": {
    "Type": "AWS::RDS::DBInstance",
    "Properties": {
      "DBInstanceIdentifier": {
        "Fn::Join": ["", ["je-", {"Ref": "FeatureName"}, "-", {"Ref": "EnvironmentName"}, "-", {"Ref": "Tenant"}]]
      },
      "DBInstanceClass": {
        "Ref": "DBClass"
      },
      "DBClusterIdentifier": {
        "Ref": "DBCluster"
      },
      "Engine": "aurora",
      "DBSubnetGroupName": {
        "Ref": "DBSubnetGroup"
      },
      "DBParameterGroupName" : { "Ref" : "DBParameterGroup" },
      "PubliclyAccessible": "false"
    }
  },

  "Hostname": {
    "Properties": {
      "Comment": "DNS for Restaurant Events RDS service",
      "HostedZoneName": {
        "Fn::Join": [
          "", [{
              "Ref": "HostedZone"
            },
            "."
          ]
        ]
      },
      "RecordSets": [{
        "Name": {
          "Fn::If": [
            "IsProduction", {
              "Fn::Join": [
                "", [{
                    "Ref": "Tenant"
                  },
                  "-restauranteventsdb.", {
                    "Ref": "HostedZone"
                  },
                  "."
                ]
              ]
            }, {
              "Fn::Join": [
                "", [{
                    "Ref": "Tenant"
                  },
                  "-restauranteventsdb-", {
                    "Ref": "EnvironmentName"
                  },
                  ".", {
                    "Ref": "HostedZone"
                  },
                  "."
                ]
              ]
            }
          ]

        },
        "SetIdentifier": {
          "Fn::Join": [
            "", [{
                "Ref": "Tenant"
              },
              "-",
              "restauranteventsdb-", {
                "Ref": "EnvironmentName"
              }
            ]
          ]
        },
        "Type": "CNAME",
        "TTL": 900,
        "Weight": 1,
        "ResourceRecords": [{
          "Fn::GetAtt": ["DBCluster", "Endpoint.Address"]
        }]
      }]
    },
    "Type": "AWS::Route53::RecordSetGroup"
  }
},


```
