**filtering**

```javascript
var ref = firebase.database().ref('appointments/' + props.userId);
ref.orderByChild('date').equalTo('21/08/2016').on('child_added', function(snapshot) {
  console.log(snapshot.key);
});
```
