# Serialize enums as string in JSON.NET

Use JsonConverter and EnumMember

```csharp
[JsonConverter(typeof(StringEnumConverter))]
public enum ApiResponseStatus
{
    [EnumMember(Value = "success")]
    Success,
    [EnumMember(Value = "error")]
    Error,
    [EnumMember(Value = "in-progress")]
    InProgress
}
```
