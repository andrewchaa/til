# NLog

* Tutorial: https://github.com/NLog/NLog/wiki/Tutorial

## Configuration

```xml
<target name="file" type="File" layout="${longdate} ${logger} ${message} ${exception:format=tostring}" fileName="${basedir}/App_Data/nlog/mimarketweb-${shortdate}.log" archiveFileName="${basedir}/App_Data/nlog/log.{#}.txt" maxArchiveFiles="7" concurrentWrites="true" keepFileOpen="false" />
```

${basedir} is where the application runs. For console, it's where the executable is

# logentries

* Create a key and put it in the config
* Install logentries.nlog 

```xml
  <appSettings>
    <add key="Logentries.Token" value="xxxxxx-02b5-40ee-8fb1-dca9cf7eaf63 " />
  </appSettings>
```
