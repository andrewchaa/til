### Setting up Web Api

    mkdir coiny
    cd coiny
    dotnet new webapi
    
    dotnet run

### Things to note

    // options
    var options = new OptionsWrapper<ZendeskOptions>(new ZendeskOptions
    {
        EndpointUri = appSettings.GetValue("zendeskurl"),
        Token = appSettings.GetValue("zendesktoken"),
        Username = appSettings.GetValue("zendeskuser")
    });


