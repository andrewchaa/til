Take out currency number by matching number only and convert it to number

```csharp
var regex = new Regex(@"([\d,.]+)");

var match = regex.Match(txtPrice.Text);

if (match.Success)
{
    txtPrice.Text = match.Groups[1].Value;
}
```
