# moq

**Return different values the first and second time**

```csharp
AssociateNewUserCommand.SetupSequence(a => a.Result).Returns(_smallDebtor.CompanyId).Returns(_mediumDebtor.CompanyId);
```

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
