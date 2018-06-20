# Regulax Expression

* [match guid](#match-guid)
* [Look Ahead](#look-ahead)

### match guid

```csharp
EndpointNameResolver = (name, uri) =>
    uri.PathAndQuery
        .Pipe(p => Regex.Replace(p, "\\/v[0-9]\\/[a-z]{0,2}\\/", string.Empty)) // remove /v1/dk
        .Pipe(p => Regex.Replace(p, "\\/[0-9a-f]{8}([0-9a-f]{4}){3}[0-9a-f]{12}", string.Empty)) // remove trailing guid on GET endpiont
        .Pipe(p => Regex.Replace(p, "\\/[0-9]+", string.Empty)) // remove int id
        .Pipe(p => p.Replace("/", "-"))

```

### Look Ahead

```csharp
.Map(r => Regex.Replace(r, "(?<=[a-zA-Z]),", string.Empty))
```

### Parse CSV with double quotes and comma separated numbers

    public IEnumerable<string> SplitCSV(string input)
    {
        Regex csvSplit = new Regex("(?:^|,)(\"(?:[^\"]+|\"\")*\"|[^,]*)", RegexOptions.Compiled);

        foreach (Match match in csvSplit.Matches(input))
        {
            yield return match.Value.TrimStart(',');
        }
    }


### convert match collection to list

```csharp
MatchCollection matchList = Regex.Matches(Content, Pattern);
var list = matchList.Cast<Match>().Select(match => match.Value).ToList();
```

### Get only the matched string

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
