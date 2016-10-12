# exactly once

```c#
It should_not_refresh_token_again = () => 
    _restClient.Verify(r => r.Execute<TokenResult>(Moq.It.IsAny<IRestRequest>()), Times.Once);
```
