##### Catpuring traffic from .NET server services

```xml
<!-- The following section is to force use of Fiddler for all applications, including those running in service accounts -->
<system.net>
  <defaultProxy
      enabled = "true"
      useDefaultCredentials = "true">
  <proxy autoDetect="false" bypassonlocal="false" proxyaddress="http://127.0.0.1:8888" usesystemdefault="false" />
  </defaultProxy>
</system.net>
```
