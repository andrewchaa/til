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
