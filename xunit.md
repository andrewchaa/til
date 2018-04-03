    // skipping a test
    [Fact (Skip = "To have a proper end-to-end tests")]
    public async Task Should_handle_the_publishing_message()
    {
        var scheduledEvent = ScheduledEvent.Create(Tenant.Uk,

    // capturing output
    public LocalFunctionTests(ITestOutputHelper output)
    {
        _output = output;
    }
    
    _output.WriteLine($"Elapsed: {watch.ElapsedTicks}");
