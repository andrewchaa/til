# Reading appsettings.json file in test project

Use `ConfigurationBuilder` 

```csharp
_config = new ConfigurationBuilder()
    .AddJsonFile($"appsettings.{environment}.json")
    .Build();
_subscriptionKey = _config["subscript_key"];
_onboardingApiHost = _config["onboarding_api_host"];
_product = _config["product"];

```
