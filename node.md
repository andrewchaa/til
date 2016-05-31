# Set Up

**Permission**
* Don't install npm packages with sudo. It changes the package folder to belong to root
* .npm needs to belong to the user
* https://docs.npmjs.com/getting-started/fixing-npm-permissions

```
sudo chown -R $(whoami) $(npm config get prefix)/{lib/node_modules,bin,share}
```


#### Tools

* nodemon: Restart webserver on file watch. https://github.com/remy/nodemon
* rimraf: delete node project who file paths are too long for windows to delete: https://github.com/isaacs/rimraf

# NPM

**Uninstall a dependency globally**

```javascript
npm uninstall electron -g
```

### Express

##### serve static files

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

#### vash

##### use control

```html
<!-- layout.vash -->
<head>@html.include("head")</head>

<!-- head.vash -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>assan - Professional theme</title>
<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- custom css (blue color by default) -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen">     
<!-- font awesome for icons -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
<!-- flex slider css -->
<link href="css/flexslider.css" rel="stylesheet" type="text/css" media="screen">
<!-- animated css  -->
<link href="css/animate.css" rel="stylesheet" type="text/css" media="screen">
<!--owl carousel css-->
<link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="screen">
<link href="css/owl.theme.css" rel="stylesheet" type="text/css" media="screen">
<!--mega menu -->
<link href="css/yamm.css" rel="stylesheet" type="text/css">
<!--popups css-->
<link href="css/magnific-popup.css" rel="stylesheet" type="text/css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

```
