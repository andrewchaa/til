# SQS 

Send a message

```csharp
public async Task<SendMessageResponse> SendSqsMessage(string queueUrl, CloudEventsMessage message)
{
    var assumeRoleResponse = await GetAssumedRole();
    var sqsClient = new AmazonSQSClient(assumeRoleResponse.Credentials);
    return await sqsClient.SendMessageAsync(queueUrl, JsonSerializer.Serialize(message));
}

private async Task<AssumeRoleResponse> GetAssumedRole()
{
    var stsClient = new AmazonSecurityTokenServiceClient(RegionEndpoint.EUWest1);
    var assumeRoleResponse = await stsClient.AssumeRoleAsync(new AssumeRoleRequest
    {
        RoleArn = OpsPipelineTestRoleArn, 
        RoleSessionName = "awssdk"
    });

    var stsClient2 = new AmazonSecurityTokenServiceClient(assumeRoleResponse.Credentials);
    var assumeRoleResponse2 = await stsClient2.AssumeRoleAsync(new AssumeRoleRequest
    {
        RoleArn = ConsignmentPipelineTestRoleArn, 
        RoleSessionName = "awssdk2"
    });

    return assumeRoleResponse;
}

```
