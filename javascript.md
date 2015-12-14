#### Resources

* javascript formatter: https://code.google.com/p/javascript-number-formatter/

##### create an asynchronous function
Use setTimeout(fn, 0);

```javascript
setTimeout(function() {
    var rawData = window.uiFacade.getWorkspacesForBrowse();
    console.log(rawData);
    if (!rawData) {
        self.errorInApiCall(false);
        self.folders([]);
        self.loadingData(false);
        return;
    }

    var folders = JSON.parse(rawData);
    if (folders.error) {
        console.log(folders);
        self.errorInApiCall(true);
        self.folders([]);
        self.loadingData(false);
        return;
    }

    self.errorInApiCall(false);
    self.folders(folders);
    self.loadingData(false);
}, 0);
```

##### HTML input fields does not get focus when clicked

This happens when you display an input box on overlay dialog box. You handle mousedown event on overlay to stop the modal dialog from losing focus. 
A side-effect is an Input box cannot have focus when selected. A simple trick is to add this.select() on click event

```html
<input data-bind="value: fileName" type="text" class="form-control" tabindex="307" onclick="this.select()" 
style="border-radius: 4px 0 0 4px">
```
