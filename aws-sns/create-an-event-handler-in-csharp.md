# Create an event handler in C#

Though it has improved a lot, still I feel like C# is not the first class citizen language on AWS. Often the examples are

* Node.js (of course. Javascript is eating the tech world)
* Golang
* Java
* Python
* ...

This is how I figured out how to write a C# handler to AWS SNS topic, using [serverless framework](https://serverless.com/). 

### Provision a topic. 

I used [serverless.yml](https://www.serverless.com/framework/docs/providers/aws/events/sns/)

```yaml
resources:
  Resources:
    companyUpdatedTopic:
      Type: AWS::SNS::Topic
      Properties:
        DisplayName: 'Company Updated'
        TopicName: CompanyUpdated
```

### Provision a function that will be bound to a SNS topic

This will create the topic also.

```csharp
  CompanyUpdatedEventHandler:
    handler: Navien.Installers.Apis::Navien.Installers.Apis.EventHandlers.CompanyUpdatedEventHandler::Handle
    package:
      artifact: bin/release/netcoreapp2.1/deploy-package.zip
    events:
      - sns: CompanyUpdated
```

If you want to bind the function to an existing topic, you have to reference the full ARN.

### Publishing a topic event

Reference `AWSSDK.SimpleNotificationService` to use the client.

```xml
<PackageReference Include="AWSSDK.Core" Version="3.7.2.8" />
<PackageReference Include="AWSSDK.SimpleNotificationService" Version="3.7.2.27" />
```

```csharp
private readonly IAmazonSimpleNotificationService _client;

public PublishCompanyUpdatedCommandHandler(IAmazonSimpleNotificationService client)
{
    _client = client;
}

public async Task<Unit> Handle(PublishCompanyUpdatedCommand command, 
    CancellationToken cancellationToken)
{
    Console.WriteLine($"Handling {command.GetType().Name}, Gas Safe Number: {command.Company.GasSafeNumber}");
    await _client.PublishAsync(new PublishRequest(CompanyUpdatedEvent.Arn,
        new CompanyUpdatedEvent(command.Company.GasSafeNumber,
            command.Company.BusinessName,
            command.Company.Address,
            command.Company.Postcode,
            command.Company.OftecNumber,
            command.Company.DateStamp).ToJson()));

    return new Unit();
}

```

### Subscribing to a topic

Once you create the function, the handle method will be bound to the topic. You need to deserialize the message and handle it within the method.

To receive the SNS event, install `Amazon.Lambda.SNSEvents` package and use `SNSEvent` class. 

```csharp
public class CompanyUpdatedEventHandler : BaseEventHandler
{
    public CompanyUpdatedEventHandler(): base(Startup.ServiceProvider) { }
    public CompanyUpdatedEventHandler(IServiceProvider services): base(services) { }

    public async Task Handle(
        SNSEvent @event, 
        ILambdaContext context)
    {
        Console.WriteLine($"Content: {@event.ToJson()}");

        var companyUpdatedEvent = JsonConvert.DeserializeObject<CompanyUpdatedEvent>(
            @event.Records.First().Sns.Message);

        var company = new Company(companyUpdatedEvent.GasSafeNumber,
            companyUpdatedEvent.BusinessName,
            companyUpdatedEvent.Address,
            companyUpdatedEvent.Postcode,
            companyUpdatedEvent.OftecNumber,
            companyUpdatedEvent.DateStamp);
        await _mediator.Send(new UpdateCompanyInformationOnUserCommand(company)); 
    }
}

```
