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

### Navigate

```javascript
const RegistrationList = ({ navigation }) => {
...
    <TouchableOpacity onPress={() => navigation.navigate('Details', {
      registration: item,
      registrationId: item.registrationId
    })}
```

### Parameters 

```javascript
export default function RegistrationDetails ({ navigation, route }) {

  const { registration } = route.params

```
