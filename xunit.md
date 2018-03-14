    // skipping a test
    [Fact (Skip = "To have a proper end-to-end tests")]
    public async Task Should_handle_the_publishing_message()
    {
        var scheduledEvent = ScheduledEvent.Create(Tenant.Uk,
