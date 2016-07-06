##### post 

```javascript
$.post('/api/checkopentime', function(result) {
    console.log(result);
    if (!result.open) {
        $('#divCannotOrderNotice').modal('show');
        return;
    }

    $.cookie('sushiwa_orders', ko.toJSON(vmOrder.orders()), { expires: 1 });
    window.location = "/order/delivery";
});

```

##### get attribute value

```javascript
var tabIndex = +$(document.activeElement).attr('tabindex');
if (tabIndex == 308 && $('#btnUpload').prop('disabled')) {
    self.focusIndex(0);
    self.focusIndex(305);
}
```
