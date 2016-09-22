```javascript
const form = state.form.EntryForm;

return ({ // mapStateToProps
  initialValues: {
    clinic: form ? form.clinic.value : 'Harley Street',
    userId: state.userId,
    date: form ? form.date.value : moment().format('DD/MM/YYYY'),
    hour: form ? form.hour.value: '9',
    minute: form ? form.minute.value: '00'
  }
})

```
