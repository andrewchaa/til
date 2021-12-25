# Cosmos DB Trigger

```typescript
import { AzureFunction, Context } from "@azure/functions"

const cosmosDBTrigger: AzureFunction = async function (
  context: Context,
  documents: any[]): Promise<void> {
    if (!!documents && documents.length > 0) {
        context.log('Document Id: ', documents[0].id);
    }
}

export default cosmosDBTrigger;
```

```json
{
  "bindings": [
    {
      "type": "cosmosDBTrigger",
      "name": "documents",
      "direction": "in",
      "leaseCollectionName": "leases",
      "connectionStringSetting": "COSMOSDB_CONNECTION_STRING",
      "databaseName": "simplyapi",
      "collectionName": "events-store",
      "createLeaseCollectionIfNotExists": true
    }
  ],
  "scriptFile": "../dist/EventsStoreTrigger/index.js"
}

```
