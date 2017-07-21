**Get value**

```csharp
public static string GetValueWithRetry(this IWebElement element)
{
    element.WaitToBeDisplayed();
    return ScrollRetryPolicy.Execute(() => element.GetAttribute("value"));
}
```
