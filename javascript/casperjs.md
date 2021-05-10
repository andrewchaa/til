##### css3 selector

```javascript
var casper = require('casper').create();

casper.start('http://domain.tld/page.html', function() {
    if (this.exists('h1.page-title')) {
        this.echo('the heading exists');
    }
});

casper.run();
```
