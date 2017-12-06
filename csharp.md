## String

**Escape a double quote in a verbatim string**

Use a duplicated double quote

    @"this ""word"" is escaped";


## Delegate

**Get name of Action / Func delegate**

```csharp
public async Task<T1> LogAndExecute<T1>(string number, Func<Task<T1>> func)
{

    Logger.LogInfo(new Info
    {
        Number = number,
        Method = func.Method.Name,
        LogType = "Pre",
        Message = $"Started calling {func.Method.Name}"
    }.ToJson());

```

## Network

### Sending mail

**Outlook removes plain text line break**

add two spaces at the beginning of each line


## HTTP related

### HttpClient

#### post string value

```csharp
var client = new HttpClient();
client.SetBearerToken(tokenResponse.AccessToken);
var url = "api endpoint";
var response = client.PostAsync(url, new FormUrlEncodedContent(new KeyValuePair<string, string>[0])).Result;
```

## Numbers

### convert to decimal

```csharp
Convert.ToDecimal(123456789012345500.12D)
```

### Turn C# object into a JSON string

```csharp
var open = new JavaScriptSerializer().Serialize(new {open = true});
```

# DateTime

**Convert Unix Epoch time to DateTime**
```csharp
public DateTime FromUnixTime(long unixTime)
{
    var epoch = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);
    return epoch.AddSeconds(unixTime);
}
```


**Compare Time of the day**

```csharp
var time = DateTime.UtcNow.ToUkDateTime().TimeOfDay;
var lunchStart = new TimeSpan(11, 30, 0);
var lunchEnd = new TimeSpan(14, 30, 0);
var dinnerStart = new TimeSpan(17, 30, 0);
var dinnerEnd = new TimeSpan(22, 30, 0);

if (time >= lunchStart && time <= lunchEnd) return open;
if (time >= dinnerStart && time <= dinnerEnd) return open;
```

**Convert to UK Time from UTC**

```csharp
public static DateTime ToUkDateTime(this DateTime dateTime)
{
    var zone = TimeZoneInfo.FindSystemTimeZoneById("GMT Standard Time");
    return TimeZoneInfo.ConvertTimeFromUtc(dateTime, zone);
}
```

**Precision time to log elapsed time**
```csharp
var watch = Stopwatch.StartNew();
durationInSeconds = watch.Elapsed.Seconds
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
