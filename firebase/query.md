**resources**

* https://www.firebase.com/docs/web/guide/retrieving-data.html#section-queries

**Indexing**

For queryByChild

```javascript
{
  "rules": {
    "appointments": {
      "$userId": {
         ".indexOn": ["date"]
      }
    }
  }
}
```

**filtering**

```javascript
var userId = 'HeFltOAjsgRrXFYZB3g2Ref33oN2';
var ref = firebase.database().ref('appointments/' + userId);
ref.orderByChild('date').equalTo('07/09/2016').once('value', function(snapshot) {
  console.log(snapshot.key);
  snapshot.forEach(function (data) {
    console.log(data.val());
  })
});
```
