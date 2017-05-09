## binding generic interface

```csharp
kernel.Bind(typeof(IRepository<>)).To(typeof(SimpleRepository<>));
```
