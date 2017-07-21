When select the last postcode in the list
And add the post code with 6,00, -1,00, 2,00 limit values
Then the correct limit values 6, -1, 2 are added

```csharp

[When(@"add the post code with (.*), (.*), (.*) limit values")]
public void AddThePostCodeWithLimitValuesWithComma(string limit, string limitLow, string limitHigh)
{
    _deliveryPricePage
        .SetLimitBox(limit)
        .SetLimitLowBox(limitLow)
        .SetLimitHighBox(limitHigh);
    _deliveryPricePage.ClickAddButton();
}


```
