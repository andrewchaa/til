### Setup

    // set up method with Action<T>
    _searchResource.Setup(s => s.SearchAsync<TicketResponse>(It.IsAny<Action<IZendeskQuery>>()))
      .Returns(Task.FromResult(_listTicketResponse));
