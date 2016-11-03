1. install packages
   ```
   Install-Package logentries.core
   Install-Package logentries.nlog
   ```

2. create log sets
   * create a log set
   * rename .NET to something like "local"
   * create another log set by choosing the existing log set
   * rename the default name .NET to something like "staging"
   
   
3. Set the token in web.config
   ```
   <add key="Logentries.Token" value="---guid---" />
   ```

4. Install NLog
   ```
   Install-Package NLog
   Install-Package NLog.Config
   Install-Package NLog.Schema
   Install-Package NLog.Web
   ```

5. Set up NLog configuration
   ```
   <extensions>
     <add assembly="CorrelatorSharp.Logging.NLog" />
     <add assembly="LogentriesNLog" />
   </extensions>

   <targets>
     <target xsi:type="File" name="file" fileName="${basedir}/logs/${shortdate}.log" layout="${longdate} ${uppercase:${level}} ${message}" />
     <target xsi:type="Logentries" name="logentries" httpPut="false" ssl="true" layout="{ &quot;logger&quot;: &quot;${logger}&quot;, &quot;level&quot;: &quot;${level}&quot;, &quot;message&quot;: &quot;${json-encode:${message}}&quot;, &quot;activity&quot;: &quot;${cs-activity-id}&quot;, &quot;parentActivity&quot;: &quot;${cs-activity-parentid}&quot;, &quot;activityInfo&quot;: &quot;${cs-activity-name}&quot;, &quot;exception&quot;: &quot;${json-encode:${exception:format=Message,tostring}}&quot; }" />
  </targets>

  <rules>
    <logger name="*" minlevel="Trace" writeTo="logentries, file" />
  </rules>

   ```
6. Lastly, if the logging still doesn't work, turn on throwExceptions. 
   ```
   <nlog xmlns="http://www.nlog-project.org/schemas/NLog.xsd"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://www.nlog-project.org/schemas/NLog.xsd NLog.xsd"
      autoReload="true"
      throwExceptions="true"
      internalLogLevel="Trace" internalLogFile="${basedir}\logs\nlog-internal.log">

   ```
