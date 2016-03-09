# Resources

* Ninject and ASP.NET Web api 2: https://github.com/ninject/Ninject.Web.Common/wiki/Setting-up-a-OWIN-WebApi-application

**Injecting logger**

```csharp
.Bind<ILog>().ToMethod(p => LogManager.GetLogger(p.Request.Target.Member.DeclaringType));
```
