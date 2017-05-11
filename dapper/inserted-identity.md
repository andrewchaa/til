```csharp
string sql = @"
INSERT INTO [MyTable] ([Stuff]) VALUES (@Stuff);
SELECT CAST(SCOPE_IDENTITY() as int)";

var id = connection.Query<int>(sql, new { Stuff = mystuff}).Single();
```
