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
You can use https://jvilk.com/MakeTypes/ to create typescript types from JSON sample

```
ng generate class model/train
ng g component train/train-times
ng g service services/traintime 
```

### Calling API

Import HttpClientModule

```javascript
// app.module.ts

  imports: [
    BrowserModule,
    HttpClientModule
  ],

```

Wrap API response with Observable

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
```

Subscribe to the observable

```javascript

// *.component.ts
  public departures: Departure[];
  ngOnInit() {
    this.traintime$ = this.traintimeService.getTraintime();
    this.traintimeService.getTraintime()
      .subscribe(t => {
        this.departures = t.departures.all;
      });
  }
```

```html
// *.component.html

<div class="row justify-content-md-center" *ngFor="let d of departures; index as i" >
  <div class="col">{{ d.destination_name }}</div>
  <div class="col">{{ d.expected_departure_time }}</div>
  <div class="col">{{ d.platform }}</div>
</div>

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
