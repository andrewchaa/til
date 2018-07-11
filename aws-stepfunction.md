# Step Function

1. [Get AWS Credentials](#get-aws-credentials)


### Get AWS Credentials

```csharp
public static AWSCredentials GetAwsCredentials()
{
    var success = new CredentialProfileStoreChain()
        .TryGetAWSCredentials("default", out var awsCredentials);

    if (success)
    {
        return awsCredentials;
    }

    return new EnvironmentVariablesAWSCredentials();
}

```


```javascript
// with choice, skip the steps not necessary

"CheckingIfEndDateExists": {
  "Type": "Choice",
  "Choices": [{
      "Variable": "$.StartOnly",
      "BooleanEquals": true,
      "Next": "CompleteState"
    }],
  "Default": "WaitingToEndScheduleEvent"
},
"CompleteState": {
  "Type": "Succeed"
}


```
