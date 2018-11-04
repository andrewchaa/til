# angular js

* [Getting started](#getting-started)
* [angular cli](#angular-cli)
* [Calling API](#calling-api)

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

Create models, components, and services

```
ng generate class model/train
ng g component train/train-times
ng g service services/traintime 
```

### Calling API

Use HttpClient and Observable for async api operation

```javascript

// *.service.ts
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';

export class TraintimeService {
  constructor(private http: HttpClient) {}

  getTraintime() : Observable<Traintime> {
    return this.http
      .get<Traintime>('https://transportapi.com/v3/uk/train/station/lst/live.json?destination=CHI');
  }
}

// *.component.ts
  ngOnInit() {
    this.traintime$ = this.traintimeService.getTraintime();
    this.traintimeService.getTraintime()
      .subscribe(t => {
        this.departures = t.departures.all;
      });
  }


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
