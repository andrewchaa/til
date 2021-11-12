# Stack Navigator

    yarn add @react-navigation/stack 
    yarn add react-native-gesture-handler
    
```javascript
const Stack = createStackNavigator();
const ListStack = () => {
  return (
    <Stack.Navigator
      screenOptions={
        () => ({
          headerShown: false
        })}
    >
      <Stack.Screen name="List" component={RegistrationList} />
      <Stack.Screen name="Details" component={RegistrationDetail} />
    </Stack.Navigator>
  );
}
```

### Navigation and parameters

```javascript
const RegistrationList = ({ navigation }) => {
...
    <TouchableOpacity onPress={() => navigation.navigate('Details', {
      registration: item,
      registrationId: item.registrationId
    })}

export default function RegistrationDetails ({ navigation, route }) {

  const { registration } = route.params

```

### Navigation event

```javascript
useEffect(() => {
const unsubscribe = navigation.addListener('focus', () => {
  const fetchList = async () => {
    try {
      setLoading(true)

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

      setRegistrations(list)
      setLoading(false)

    } catch (error) {
      console.log("error", error)
    }
  }

  fetchList()
})

return unsubscribe
}, [navigation])

```
