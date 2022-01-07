# lambda

Invoke lambda directly

```csharp
public async Task<InvokeResponse> InvokeCreateConsignmentLambda(string orderId, 
    OrderDelivery orderDelivery)
{
    var assumeRoleResponse = await GetAssumedRole();
    var lambdaClient = new AmazonLambdaClient(assumeRoleResponse.Credentials);
    var invokeRequest = new InvokeRequest
    {
        InvocationType = InvocationType.RequestResponse,
        FunctionName = "create-consignment",
        Payload = JsonSerializer.Serialize(new CreateConsignmentRequest
        {
            OrderId = orderId,
            Deliveries = new []{ orderDelivery }
        })
    };

    return await lambdaClient.InvokeAsync(invokeRequest);
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
