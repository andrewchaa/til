##### HTML input fields does not get focus when clicked

This happens when you display an input box on overlay dialog box. You handle mousedown event on overlay to stop the modal dialog from losing focus. 
A side-effect is an Input box cannot have focus when selected. A simple trick is to add this.select() on click event

```html
<input data-bind="value: fileName" type="text" class="form-control" tabindex="307" onclick="this.select()" 
style="border-radius: 4px 0 0 4px">
```
