# Deploy Azure function with Azure Functions Core Tool

[Azure Functions Core Tool](https://docs.microsoft.com/en-us/azure/azure-functions/functions-run-local?tabs=macos%2Ccsharp%2Cbash) 
let you run azure functions on your local machine and deployo them to Azure. 

### Populating Azure Credentials

It requires AZ Login and you need to pass [Azure credentials](https://github.com/marketplace/actions/azure-login) from Github secrets.

The output format is like this

```json
{
  "clientId": "{{GUID}}",
  "clientSecret": "{{Secret}}",
  "subscriptionId": "{{GUID}}",
  "tenantId": "{{GUID}}"
}
```

