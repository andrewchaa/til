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
