# Tab Navigation

https://reactnavigation.org/docs/tab-based-navigation/

    yarn add @react-navigation/native
    yarn add @react-navigation/bottom-tabs
    
```javascript
const Tab = createBottomTabNavigator()

<NavigationContainer
  header
>
  <Tab.Navigator
    screenOptions={({ route }) => ({
      headerShown: false,
      tabBarIcon: ({ focused, color, size }) => {
        let IconComponent = IconMCI;
        let iconName;

        if (route.name === 'News') iconName = 'alert';
        else if (route.name === 'List') iconName = 'file-document';
        else if (route.name === 'New') iconName = 'plus-circle';
        else if (route.name === 'Profile') iconName = 'account';
        else if (route.name === 'Home') iconName = 'home';

        const iconColor = focused
        ? '#06A4CB'
        : '#8FA0BE'

        return <IconMCI name={iconName} size={size} color={iconColor} />
      }
    })}
    >
    <Tab.Screen name="Home" component={Home} />
    <Tab.Screen name="List" component={RegistrationList} />
    <Tab.Screen name="News" component={News} />
    <Tab.Screen name="Profile" component={Profile} />
  </Tab.Navigator>
</NavigationContainer>

```
    
