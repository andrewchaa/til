#### Tools

* nodemon: Restart webserver on file watch. https://github.com/remy/nodemon
* rimraf: delete node project who file paths are too long for windows to delete: https://github.com/isaacs/rimraf

##### serve statif files

```javascript
var http = require('http');
var express = require('express');
var app = express();

app.use(express.static(__dirname));

var server = app.listen("3100", function () {
	console.log("listening on port %d", server.address().port)
});
```

##### Change default root

In package.json, add:

```javascript
"scripts": {
    "start": "node index.js"
}
```

or for windows azure, create a web.config (http://stackoverflow.com/questions/15439345/default-root-server-js-file-for-node-js-site-on-windows-azure)

```xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
    <system.webServer>         
      <handlers>
           <add name="iisnode" path="server.js" verb="*" modules="iisnode"/>
     </handlers>
      <rewrite>
           <rules>
                <rule name="LogFile" patternSyntax="ECMAScript" stopProcessing="true">
                     <match url="iisnode"/>
                </rule>
                <rule name="NodeInspector" patternSyntax="ECMAScript" stopProcessing="true">                    
                    <match url="^server.js\/debug[\/]?" />
                </rule>
                <rule name="StaticContent">
                     <action type="Rewrite" url="public{{REQUEST_URI}}"/>
                </rule>
                <rule name="DynamicContent">
                     <conditions>
                          <add input="{{REQUEST_FILENAME}}" matchType="IsFile" negate="True"/>
                     </conditions>
                     <action type="Rewrite" url="server.js"/>
                </rule>
           </rules>
      </rewrite>
   </system.webServer>
 </configuration>
```
