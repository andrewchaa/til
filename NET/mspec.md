##### Ignoring exception in the test

```csharp
Because of = () => Catch.Exception(() => _service.Advance(_advance, _adminUser, false));

It should_not_send_emails = () => _serviceLocator.Verify(s => s.GetAllInstances<IDomainEventHandlerAfterTransaction<AdvancedEvent>>(), Times.Never());
```
