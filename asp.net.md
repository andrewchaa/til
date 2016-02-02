## Configuration

**config file transformation**

```xml
<!-- web.config -->
<logger name="*" minlevel="Debug" writeTo="logentries,file" />

<!-- web.Staging.config -->
<logger name="*" minlevel="Debug" xdt:Transform="SetAttributes(minlevel)" xdt:Locator="Match(name)" />
<logger name="*" writeTo="logentries" xdt:Transform="SetAttributes(writeTo)" xdt:Locator="Match(name)" />
```



