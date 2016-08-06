```javascript
'use strict';

var express = require('express');
var path = require('path');

var app = express();

app.use(express.static(path.resolve(path.join(__dirname, '/build'))));

app.get('/', function (req, res) {
  res.sendFile(path.join(__dirname + '/build/index.html'));
});

var server = app.listen(process.env.PORT || 8080, function () {
  console.log('App listening on port %s', server.address().port);
  console.log('Press Ctrl+C to quit.');
});

```
