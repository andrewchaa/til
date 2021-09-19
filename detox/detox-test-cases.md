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
