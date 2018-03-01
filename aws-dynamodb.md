## Resources

* [Creating Amazon DynamoDB Tables with PowerShell](https://aws.amazon.com/blogs/developer/creating-amazon-dynamodb-tables-with-powershell/)

### CRUD

    //creating tables with Powershell
    function Get-RestaurantEventsTableSchema() {
        New-DDBTableSchema | Add-DDBKeySchema -KeyName "ScheduledEventId" -KeyDataType "S"
    }
    TryCreateTable "restaurantdevents-scheduledevents" $readUnits $writeUnits 
        (Get-RestaurantEventsTableSchema)
