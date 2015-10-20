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
