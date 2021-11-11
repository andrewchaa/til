# spread ...

Copy object values

```javascript
const reg = { ...registration }
Object.entries(reg).map(([key, value]) => {
  if (!value) {
    delete reg[key]
  }
});
```
