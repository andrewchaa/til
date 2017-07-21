**Select the last option**

```csharp
public static void SelectLastItem(IWebElement dropdown)
{
    dropdown.Children(By.TagName("option")).Last().ClickWithRetry();
}
```
