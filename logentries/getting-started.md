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
   
   
2. Set the token in web.config
   ```
   <add key="Logentries.Token" value="---guid---" />
   ```
