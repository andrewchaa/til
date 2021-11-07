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

