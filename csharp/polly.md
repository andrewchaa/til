## Usages

    // wait and try async
    async Task TakeRestaurantsOffline()
    {
        _logger.LogInformation($"putting offline restaurants of {command.RestaurantIds.Count()}");
        await _restaurantRepository.TakeOffline(command.Tenant, command.RestaurantIds);

        _logger.LogInformation($"logging offline activities of {command.RestaurantIds.Count()} restaurants");
        await _restaurantLogRepository.LogOfflineActivity(command.Tenant, command.RestaurantIds);

        _logger.LogInformation($"logging state change of {command.RestaurantIds.Count()} restaurants");
        await _restaurantLogRepository.LogRestaurantStateChange(command.Tenant, command.RestaurantIds);
    }

    await Policy
        .Handle<Exception>()
        .WaitAndRetryAsync(new[]
        {
            TimeSpan.FromSeconds(1),
            TimeSpan.FromSeconds(2),
            TimeSpan.FromSeconds(3)
        }, async (exception, timeSpan) => await TakeRestaurantsOffline())
        .ExecuteAsync(async () => await TakeRestaurantsOffline());
