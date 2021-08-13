# Getting started with [K6](https://k6.io/docs/)

> k6 is a developer-centric, free and open-source load testing tool built for making performance testing a productive and enjoyable experience.

### Installation

https://k6.io/docs/getting-started/installation/


    # on mac
    brew install k6

    # windows
    choco install k6
    
    # docker
    docker pull loadimpact/k6

### Running local tests

```javascript
import http from 'k6/http';
import { sleep } from 'k6';

export default function () {
  http.get('https://test.k6.io');
  sleep(1);
}
```

    k6 run script.js

Adding more VUs (Virtual Users)

    k6 run --vus 10 --duration 30s script.js

