# Azure Storage

* [blob download on asp.net](#blob-download-on-asp-net)

### blob download on asp.net

```csharp
[HttpGet]
public async Task<IActionResult> Get()
{
    var storageAccount = CloudStorageAccount.Parse(ConnectionString);
    var client = storageAccount.CreateCloudBlobClient();
    var container = client.GetContainerReference("append-example");
    await container.CreateIfNotExistsAsync();

    var localFileName = @"C:\temp\csv-100.csv";
    var blob = container.GetAppendBlobReference($"{DateTime.Now:yyyy-MM-dd-HH}.csv");
    if (!await blob.ExistsAsync())
        await blob.CreateOrReplaceAsync();

    var stopwatch = new Stopwatch();
    stopwatch.Start();
    for (int i = 0; i < 100; i++)
    {
        await blob.AppendFromFileAsync(localFileName);
    }

    Console.WriteLine($"Total seconds: {stopwatch.Elapsed.TotalSeconds}");

    var stream = await blob.OpenReadAsync();
    return File(stream, blob.Properties.ContentType, "append-blob.csv");
}

```
