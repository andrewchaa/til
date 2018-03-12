## Resources

* [Creating Amazon DynamoDB Tables with PowerShell](https://aws.amazon.com/blogs/developer/creating-amazon-dynamodb-tables-with-powershell/)

### Set up

* [Download AWS Tools for Windows Powershell](https://aws.amazon.com/powershell/) and install it

### CRUD

    // Creating tables with Powershell
    function Get-RestaurantEventsTableSchema() {
        New-DDBTableSchema | Add-DDBKeySchema -KeyName "ScheduledEventId" -KeyDataType "S"
    }
    TryCreateTable "restaurantdevents-scheduledevents" $readUnits $writeUnits 
        (Get-RestaurantEventsTableSchema)

    // PutItemAsync replaces the item by default. Use composite key. Timestamp needs to be upto milliseconds
    var response = await _dynamoDb.PutItemAsync(
        tableName: GetTenantSpecificTableName(@event.Tenant),
        item: new Dictionary<string, AttributeValue>
        {
            {nameof(@event.ScheduledEventId), new AttributeValue {S = @event.ScheduledEventId.ToString()}},
            {nameof(@event.TimeStamp), new AttributeValue {S = @event.TimeStamp.ToIsoMilliseconds()}},
            {"EventType", new AttributeValue {S = @event.GetType().Name}},
            {nameof(@event), new AttributeValue {S = JsonConvert.SerializeObject(@event)}}
        });
