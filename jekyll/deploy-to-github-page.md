1. go to settings and set github pages branch to master
2. the default address becomes like http://andrewchaa.github.io/funkorean
3. set the custom domain


**Resources**

* http://jmcglone.com/guides/github-pages/

The url of the page is like https://andrewchaa.github.io/londoneducationtrou
Change the source of the github page in settings to master or gh-page


**Use site.github.url**

```html
  <link rel="stylesheet" href="{{ "/css/bootstrap.min.css" | prepend: site.github.url }}">
  <link rel="stylesheet" href="{{ "/css/site.css" | prepend: site.github.url }}">
```
