##### Turn C# object into a JSON string

```csharp
var open = new JavaScriptSerializer().Serialize(new {open = true});
```

##### Compare Time of the da

```csharp
var time = DateTime.UtcNow.ToUkDateTime().TimeOfDay;
var lunchStart = new TimeSpan(11, 30, 0);
var lunchEnd = new TimeSpan(14, 30, 0);
var dinnerStart = new TimeSpan(17, 30, 0);
var dinnerEnd = new TimeSpan(22, 30, 0);

if (time >= lunchStart && time <= lunchEnd) return open;
if (time >= dinnerStart && time <= dinnerEnd) return open;
```
