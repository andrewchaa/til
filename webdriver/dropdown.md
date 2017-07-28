**Select the last option**

```csharp
public static void SelectLastItem(IWebElement dropdown)
{
    dropdown.Children(By.TagName("option")).Last().ClickWithRetry();
}
```

**Select by Text**

```csharp
using OpenQA.Selenium.Support.UI;

// select the drop down list
var education = driver.FindElement(By.Name("education"));
//create select element object 
var selectElement = new SelectElement(education);

//select by value
selectElement.SelectByValue("Jr.High"); 
// select by text
selectElement.SelectByText("HighSchool");
 
```
