**refresh observablearray**
```html
self.refresh = function () {
    var data = self.orders().slice(0);
    self.orders([]);
    self.orders(data);
};

self.confirm = function (order) {
    $.post('/api/orders/' + order.orderNo + '/confirm', function () {
        console.log('confirmed');
        order.orderStatus = 'Confirmed';
        self.refresh();
    });

}
```

**style binding**

```html
<span data-bind="click: $parent.confirm, style: { color: orderStatus == 'Confirmed' ? 'green' : 'white'}" class="glyphicon glyphicon-ok" aria-hidden="true" style="cursor: pointer" title="Confirm the order"></span>
```

**first item check in foreach binding**
```html
<table style="width: 100%">
    <tbody data-bind="foreach: folders">
        <!-- ko if: $index() == 0 -->
        <tr data-automation="folder"><td data-bind="text: Title, command: $parent.clickFolder, tabCommand: {shift: $parent.focusPrevious }" tabindex="302"></td></tr>
        <!-- /ko -->
        <!-- ko if: $index() != 0 -->
        <tr data-automation="folder"><td data-bind="text: Title, command: $parent.clickFolder" tabindex="302"></td></tr>
        <!-- /ko -->
    </tbody>
</table>
```


**if containless binding**

```html
<!-- ko if: errorInApiCall -->
<table style="width: 100%">
    <tbody>
        <tr data-automation="folder"><td tabindex="306">Cannot retrieve the data at the moment. Please try again later</td></tr>
    </tbody>
</table>
<!-- /ko -->
```
