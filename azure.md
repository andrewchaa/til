# Web app

**Pre-requisites**

* Microsoft Azure SDK for .NET (VS 2015) - Mandatory
* Microsoft Azure Cross-platform Command Line Tools
* Microsoft Azure PowerShell

**When creating a web app**

* Tick on Always on
* Scale out, if you need to. Increase CPU count by 1 if it's over 80%
* bind SSL certificate to host name

# node.js

**deploying node.js application**

You need a web.config, yuck!
https://msdn.microsoft.com/en-us/Library/vs/alm/Build/azure/nodejs

```xml
﻿<?xml version="1.0" encoding="utf-8"?>
<!--
     This configuration file is required if iisnode is used to run node processes behind
     IIS or IIS Express.  For more information, visit:

     https://github.com/tjanczuk/iisnode/blob/master/src/samples/configuration/web.config
-->

<configuration>
  <system.webServer>
    <!-- Visit http://blogs.msdn.com/b/windowsazure/archive/2013/11/14/introduction-to-websockets-on-windows-azure-web-sites.aspx for more information on WebSocket support -->
    <webSocket enabled="false" />
    <handlers>
      <!-- Indicates that the server.js file is a node.js site to be handled by the iisnode module -->
      <add name="iisnode" path="server.js" verb="*" modules="iisnode"/>
    </handlers>
    <rewrite>
      <rules>
        <!-- Do not interfere with requests for node-inspector debugging -->
        <rule name="NodeInspector" patternSyntax="ECMAScript" stopProcessing="true">
          <match url="^server.js\/debug[\/]?" />
        </rule>

        <!-- First we consider whether the incoming URL matches a physical file in the /public folder -->
        <rule name="StaticContent">
          <action type="Rewrite" url="public{REQUEST_URI}"/>
        </rule>

        <!-- All other URLs are mapped to the node.js site entry point -->
        <rule name="DynamicContent">
          <conditions>
            <add input="{REQUEST_FILENAME}" matchType="IsFile" negate="True"/>
          </conditions>
          <action type="Rewrite" url="server.js"/>
        </rule>
      </rules>
    </rewrite>

    <!-- 'bin' directory has no special meaning in node.js and apps can be placed in it -->
    <security>
      <requestFiltering>
        <hiddenSegments>
          <remove segment="bin"/>
        </hiddenSegments>
      </requestFiltering>
    </security>

    <!-- Make sure error responses are left untouched -->
    <httpErrors existingResponse="PassThrough" />

    <!--
      You can control how Node is hosted within IIS using the following options:
        * watchedFiles: semi-colon separated list of files that will be watched for changes to restart the server
        * node_env: will be propagated to node as NODE_ENV environment variable
        * debuggingEnabled - controls whether the built-in debugger is enabled

      See https://github.com/tjanczuk/iisnode/blob/master/src/samples/configuration/web.config for a full list of options
    -->
    <!--<iisnode watchedFiles="web.config;*.js"/>-->
  </system.webServer>
</configuration>

```

# WebJob

Resources
* Create a webjob: https://azure.microsoft.com/en-gb/documentation/articles/web-sites-create-web-jobs/
* Scheduling: http://blog.amitapple.com/post/2015/06/scheduling-azure-webjobs/#.VugTFhzhCUk
* Enable webjobs deployment for an existing Console Application project: https://azure.microsoft.com/en-us/documentation/articles/websites-dotnet-deploy-webjobs/#convert

**CRON expression**

* Install-Package Microsoft.Web.WebJobs.Publish
* create a file, settings.job
* build action should be "Copy Always" or "Copy if newer"
* the expression is {second} {minute} {hour} {day} {month} {day of the week}

```xml
{
    "schedule": "0 */15 * * * *"
}
```

For example,
* Every hour (i.e. whenever the count of minutes is 0): 0 0 * * * *
* Every hour from 9 AM to 5 PM: 0 0 9-17 * * *
* At 9:30 AM every day: 0 30 9 * * *
* At 9:30 AM every week day: 0 30 9 * * 1-5
