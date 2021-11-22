# React Native Camera

By default, it reads the barcode multiple times. Use a flagging variable to handle it only once

```javascript
let read = false


function getModel(e) {
if (read) {
  return
}
read = true

const model = findModel(e.data)

if(!model||model==='') {
  Alert.alert(
    'Model not found',
    'The barcode does not match any model. Please enter the model manually. If you are not sure, please contact Navienuk.',
    [
      {
        text: 'Ok',
        style: "ok",
        onPress: () => {
          read = false
        }
      },
    ],
    {
      cancelable: true,
      onDismiss: () => {
        read = false
      }
    }
  )
  return
}

setRegistration({ ...registration,
  model: model,
  serialNumber: e.data
})

navigation.navigate('Form')
}

```
