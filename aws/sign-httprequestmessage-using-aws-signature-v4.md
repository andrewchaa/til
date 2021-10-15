# Sign HttpRequestMessage using AWS Signature v4

To authorise an API call to AWS services with your client id and client secret, you have to sign the request by adding `Authorization` header.

https://github.com/tsibelman/aws-signer-v4-dot-net

```csharp
public async Task Should_get_a_user_by_email()
{
    // arrange
    var client = new HttpClient();

    var signer = new Aws4RequestSigner("client_id", "client_secret");
    var message = new HttpRequestMessage
    {
        Method = HttpMethod.Get,
        RequestUri =
            new Uri(
                "https://xxxx.execute-api.eu-west-1.amazonaws.com/dev/users?email=email%40gmail.com")
    };
    var request = await signer.Sign(message,
        "execute-api",
        "eu-west-1");

    // act
    var response = await client.SendAsync(request);

    // assert
    Assert.That(response.StatusCode, Is.EqualTo(HttpStatusCode.OK));
}

```
