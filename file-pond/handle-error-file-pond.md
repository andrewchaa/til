# Handling error with file pond

* load: for success
* error: for error

```javascript
const process = async (
  fieldName,
  file,
  metadata,
  load,
  error,
  progress,
  abort,
  transfer,
  options
) => {
  const uploadResult = await uploadAttachment(file);
  if (!uploadResult.ok) {
    addToast(uploadResult.message, {
      appearance: "error",
      autoDismiss: false,
    })
    error(uploadResult.message)
    return
  }

  load("success")
  setAttachments((x) => [...x, uploadResult.attachment])
}

```
