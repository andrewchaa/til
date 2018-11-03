# angular js

* [getting started](#getting started)
* [angular cli](#angular-cli)

### Getting started

Install node.js
Install [angular cli](#angular-cli)
Create a scaffold

```
ng new guessthenumber --inlineTemplate
cd guessthenumber
ng serve
```

Install bootstrap and add it to styles in angular.json

```javascript
npm i --save bootstrap

"styles": [
  "node_modules/bootstrap/dist/css/bootstrap.min.css",
  "src/styles.css"
],

```



### angular cli

https://cli.angular.io/

```
brew install node // if it complains about node version
```

```
npm i -g @angular/cli

ng new hello-world
ng serve

ng g component header       // generate header component
```    
