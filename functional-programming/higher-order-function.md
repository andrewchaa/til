# Higher order function

```javascript
const once = fn => {
  let done = false;
  return (...args) => {
    if (!done) {
      done = true;
      fn(...args);
    }
  };
};

const onceAndAfter = (f, g) => {
  let done = false;
  return (...args) => {
    if (!done) {
      done = true;
      f(...args);
    } else {
      g(...args);
    }
  };
};

```

```html
<button id="billButton" onclick="once(billTheUser)(some, sales, data)">
  Bill me
</button>;
```
