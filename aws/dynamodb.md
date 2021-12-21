## Resources

* [Creating Amazon DynamoDB Tables with PowerShell](https://aws.amazon.com/blogs/developer/creating-amazon-dynamodb-tables-with-powershell/)

### Set up

* [Download AWS Tools for Windows Powershell](https://aws.amazon.com/powershell/) and install it

### CRUD

Saving with Data Model

```csharp

// ServierRegistration.cs
// Assembly: AWSSDK.Extensions.NETCore.Setup
public void ConfigureServices(IServiceCollection services, IConfiguration configuration)
{
    services.AddAWSService<IAmazonDynamoDB>()
        .AddDefaultAWSOptions(configuration.GetAWSOptions())
        ;
}

// data model
[DynamoDBTable("contacts-api-contacts")]
public class OrderDeliveries
{
    [DynamoDBHashKey("contactId")]
    public string ContactId { get; set; }

    [DynamoDBProperty("addresses", typeof(DynamoDbJsonConverter<Address[]>))]
    public Address[] Addresses { get; set; }
}


// Repository
    try
    {
        var context = new DynamoDBContext(_dynamoDbClient);
        await context.SaveAsync(orderDeliveries);
        return (true, null);
    }
    catch (Exception ex)
    {
        _logger.FixToday(ex, 
            $"Failed to save contacts to DynamoDB for ContactId: {contactId}");
        return (false, ex);
    }

```

```csharp

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


// Save
var credentials = new BasicAWSCredentials("accesskey", "access secret");
var dynamoDb = new AmazonDynamoDBClient(credentials, RegionEndpoint.EUWest2);

var response = await dynamoDb.PutItemAsync(
    tableName: "HistoricalRates",
    item: new Dictionary<string, AttributeValue>
    {
        {"Currency", new AttributeValue {S = "BTC"}},
        {"Date", new AttributeValue {S = DateTime.Today.ToString("yyyy-MM-dd")}},
        {"Rates", new AttributeValue {S = JsonConvert.SerializeObject(new { Test = 1})}}
    });

```
