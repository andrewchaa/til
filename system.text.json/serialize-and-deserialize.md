# Serializatioin and Deserialization with System.Text.Json

### Serialization

```csharp
// simple
var jsonString = JsonSerializer.Serialize(weatherForecast);

// with options
var options = new JsonSerializerOptions { WriteIndented = true };
var jsonString = JsonSerializer.Serialize(weatherForecast, options);
```

### Deserialization

```csharp
// simple
var weatherForecast = JsonSerializer.Deserialize<WeatherForecast>(jsonString);
```
