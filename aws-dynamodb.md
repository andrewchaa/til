## Resources

* [Creating Amazon DynamoDB Tables with PowerShell](https://aws.amazon.com/blogs/developer/creating-amazon-dynamodb-tables-with-powershell/)

### Set up

* [Download AWS Tools for Windows Powershell](https://aws.amazon.com/powershell/) and install it

### CRUD

    //creating tables with Powershell
    function Get-RestaurantEventsTableSchema() {
        New-DDBTableSchema | Add-DDBKeySchema -KeyName "ScheduledEventId" -KeyDataType "S"
    }
    TryCreateTable "restaurantdevents-scheduledevents" $readUnits $writeUnits 
        (Get-RestaurantEventsTableSchema)
