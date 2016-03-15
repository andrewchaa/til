# moq

**Callbacks**

```csharp
// access invocation arguments
mock.Setup(foo => foo.Execute(It.IsAny<string>()))
    .Returns(true)
    .Callback((string s) => calls.Add(s));
```

**Verify that a method was not called**

```csharp
It should_not_send_the_message = () => _restClient.Verify(r => r.Execute(Moq.It.IsAny<IRestRequest>()), Times.Never);
```
