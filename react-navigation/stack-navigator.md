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
