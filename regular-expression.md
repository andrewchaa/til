## convert match collection to list

```csharp
MatchCollection matchList = Regex.Matches(Content, Pattern);
var list = matchList.Cast<Match>().Select(match => match.Value).ToList();
```

## Get only the matched string

```csharp
var linkRegex = "<a class=\"product-card_link js-product-card_link\" href=\"(.*?)\">";
var matches = Regex.Matches(pageContent, linkRegex);

var links = matches.Cast<Match>().Select(m => m.Groups[1].Value).ToList();

```

Take out currency number by matching number only and convert it to number

```csharp
var regex = new Regex(@"([\d,.]+)");

var match = regex.Match(txtPrice.Text);

if (match.Success)
{
    txtPrice.Text = match.Groups[1].Value;
}
```
