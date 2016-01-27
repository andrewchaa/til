# NLog

* Tutorial: https://github.com/NLog/NLog/wiki/Tutorial

## File logging format

```xml
<target name="file" type="File" layout="${longdate} ${logger} ${message} ${exception:format=tostring}" fileName="${basedir}/App_Data/nlog/mimarketweb-${shortdate}.log" archiveFileName="${basedir}/App_Data/nlog/log.{#}.txt" maxArchiveFiles="7" concurrentWrites="true" keepFileOpen="false" />
```
