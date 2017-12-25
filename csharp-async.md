### basic

    // return Task all the time
    public async Task DoWorkAsync(int parameter)
    {
      await Task.Delay(parameter);
      Console.WriteLine("Awiated the delayed time");
    }

    // composition of async task
    public async Task<double> GetSumAsync()
    {
        var left = await GetNumberAsync();
        var right = await GetNumberAsync();
        
        return left + right;
    }


### parallelism

    // start and wait for all to complete
    var left = updateLeft(generator);
    var right = updateRight(generator);
    
    await Task.When.All(left, right);
    await updateTotal(generator);

    // avoid serial await. use list of tasks for a loop
    var tasks = new List<Task>();
    foreach (var episode in eposodes)
    {
        tasks.Add(downloadAsync(episode.url);
    }
    await Task.WhenAll(tasks);

### UI Context and threadpool

    // Use available thread-pool whenever possible
    var file = await folder.CreateFileAsync(name, CreationCollisonOption.GenerateUniqueName)
        .AsTask().ConfigureAwait(continueOnCapturedContext: false);
        
    // When touching UI element, can't use thread-pool thread
    var file = await folder.CreateFileAsync(name, CreationCollisonOption.GenerateUniqueName);
