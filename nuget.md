**Restore packages**

```
.\nuget\nuget.exe restore
```

**Update a package**
```powershell
Update-Package MarketInvoice.Infrastructure.Audit
```

**Setting up a cache**
C:\Users\a.chaa\AppData\Local\NuGet\Cache

**Get packages and their installed projects**
```
PM> Get-Package -Filter Ninject

Id                                  Versions                                 ProjectName

--                                  --------                                 -----------

Ninject                             {3.2.2.0}                                MarketInvoice.Reconciliation.Tests                          
Ninject                             {3.2.2.0}                                MarketInvoice.Reconciliation.Api     
```
