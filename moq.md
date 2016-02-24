# moq

**Callbacks**

```csharp
// access invocation arguments
mock.Setup(foo => foo.Execute(It.IsAny<string>()))
    .Returns(true)
    .Callback((string s) => calls.Add(s));
```
