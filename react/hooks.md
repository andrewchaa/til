# React Hooks

Use `useEffect` to fetch data from an api call. With `useffect`, you can use Hooks's lifecycle.

```javascript
const RegistrationList = () => {

  const [registrations, setRegistrations] = useState([])

  useEffect(() => {

    const fetchList = async () => {
      try {
        const user = await Auth.currentAuthenticatedUser()
        if (!user) {
          return
        }

        const { attributes: { sub }} = user
        const list = await API.get(
          registrationApiName,
          `${registrationPath}/${sub}`,
          {}
        )

        console.log(list)
        setRegistrations(list)

      } catch (error) {
        console.log("error", error)
      }
    }

    fetchList()

  }, [])
```

`useState()` with object

Use spread operator

```javascript
<View style={styles.leftFormField}>
  <FormFloatingTitleInput
    title="Product Model"
    value={registration.model}
    editable={__DEV__ ? true : false}
    onChangeText={model => setRegistration({...registration, model})}
    error={validation.model}
  />
</View>
```
