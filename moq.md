### Usage

    // set up method with Action<T>
    _searchResource.Setup(s => s.SearchAsync<TicketResponse>(It.IsAny<Action<IZendeskQuery>>()))
      .Returns(Task.FromResult(_listTicketResponse));

    // Return different results per call
    _restaurantRepository.SetupSequence(r => r.TakeOffline(Tenant.Uk, _testRestaurantIds))
        .Throws<Exception>()
        .Throws<Exception>()
        .Throws<Exception>()
        .Throws<Exception>()
        .Returns(Task.CompletedTask);
