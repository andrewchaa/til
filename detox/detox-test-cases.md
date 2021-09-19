# Detox test cases

```javascript
await expect(element(by.text(('Please Log In'))).toBeVisible()

await element(by.id('username-textinput')).typeText('admin')
```

### Matchers

* `by.id()`
* `by.text()`

### Actions

* `.tap()`
* `.longPress()`
* `.multiTap()`
* `.scroll()`
* `.swipe()`
* `.typeText()`
* `.replaceText()`
* `.clearText()`

### Expectations

* `.toBeVisible()`
* `.toExist()`
* `.toHaveText()`

### Device Object

* `device.launchApp()`
* `device.reloadReactNative()`
* `device.openURL(url)`
* `device.sendUserNotification(params)`
