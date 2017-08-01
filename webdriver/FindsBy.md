```csharp
// multiple locations
[FindsBy(How = How.Name, Using = "anElementName", Priority = 0)]
[FindsBy(How = How.Name, Using = "differentElementName", Priority = 1)]
public IWebElement thisElement;


```
