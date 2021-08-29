e# Create an event handler in C#

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

### Provision a function that will subscribe to the topic

```csharp
  CompanyUpdatedEventHandler:
    handler: Navien.Installers.Apis::Navien.Installers.Apis.EventHandlers.CompanyUpdatedEventHandler::Handle
    package:
      artifact: bin/release/netcoreapp2.1/deploy-package.zip
    events:
      - sns: CompanyUpdated
```
