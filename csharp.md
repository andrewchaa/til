## Types

### string

    // escape verbatim string
    @"this ""word"" is escaped";

    // Compare two string arrays
    _client.Setup(c => c.Organizations.GetAllByExternalIdsAsync(
        It.Is<string[]>(s => s.SequenceEqual(new[] { "123" })), 
        It.IsAny<PagerParameters>()))
        .Returns(Task.FromResult((IPagination<Organization>)new OrganizationsResponse
        {
            Organizations = new List<Organization>(),
            Count = 0
        }));
    
### decimal
    
    Convert.ToDecimal(123456789012345500.12D)
    
### enum

    // to parse enum
    public static T To<T>(this string value) where T : struct
    {
        return Enum.Parse<T>(value, true);
    }
    
    // to store enum as string in db
    [JsonConverter(typeof(StringEnumConverter))]
    public enum FilterType
    {
        BrandName,
        RestaurantIds,
        Postcode
    }


### DateTime

```csharp

// DateTimeOffset offset exception
// Set Unspecified kind

var input = DateTime.SpecifyKind(dateTime, DateTimeKind.Unspecified);

if (tenant == Tenant.Dk)
    return new LocalDateTime(new DateTimeOffset(input, TimeZoneInfo.FindSystemTimeZoneById("Central European Standard Time").GetUtcOffset(input)));

return new LocalDateTime(new DateTimeOffset(input, TimeZoneInfo.FindSystemTimeZoneById("GMT Standard Time").GetUtcOffset(input)));


// Convert Unix Epoch time to DateTime
public DateTime FromUnixTime(long unixTime)
{
    var epoch = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);
    return epoch.AddSeconds(unixTime);
}

// Convert to UK Time from UTC
public static DateTime ToUkDateTime(this DateTime dateTime)
{
    var zone = TimeZoneInfo.FindSystemTimeZoneById("GMT Standard Time");
    return TimeZoneInfo.ConvertTimeFromUtc(dateTime, zone);
```

// To ISO String
DateTime.UtcNow.ToString("s", CultureInfo.InvariantCulture)

// Compare Time of the day
var time = DateTime.UtcNow.ToUkDateTime().TimeOfDay;
var lunchStart = new TimeSpan(11, 30, 0);
var lunchEnd = new TimeSpan(14, 30, 0);
var dinnerStart = new TimeSpan(17, 30, 0);
var dinnerEnd = new TimeSpan(22, 30, 0);

if (time >= lunchStart && time <= lunchEnd) return open;
if (time >= dinnerStart && time <= dinnerEnd) return open;

// To ISO String upto milliseconds
public static string ToIsoMilliseconds(this DateTime dateTime)
{
    return dateTime.ToString("yyyy-MM-dd HH:mm:ss.fff", CultureInfo.InvariantCulture);
}



// Precision time to log elapsed time
var watch = Stopwatch.StartNew();
durationInSeconds = watch.Elapsed.Seconds
```

### Delegate


    // Get name of Action / Func delegate**
    public async Task<T1> LogAndExecute<T1>(string number, Func<Task<T1>> func)
    {

        Logger.LogInfo(new Info
        {
            Number = number,
            Method = func.Method.Name,
            LogType = "Pre",
            Message = $"Started calling {func.Method.Name}"
        }.ToJson());

### Linq

    //Distinct
    IEnumerable<Customer> filteredList = originalList
      .GroupBy(customer => customer.CustomerId)
      .Select(group => group.First());

#### post string value

```csharp
var client = new HttpClient();
client.SetBearerToken(tokenResponse.AccessToken);
var url = "api endpoint";
var response = client.PostAsync(url, new FormUrlEncodedContent(new KeyValuePair<string, string>[0])).Result;
```


### Turn C# object into a JSON string

```csharp
var open = new JavaScriptSerializer().Serialize(new {open = true});
```


**Check if an object can be cast to a type**

```csharp
var timestampable = entry.Entity as ITimestampable;
if (timestampable == null)
    continue;

```

## String

### Custom Numeric Format Strings

https://msdn.microsoft.com/en-us/library/0c899ak8(v=vs.110).aspx
