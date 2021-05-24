# Async Storage issues

```
[@RNC/AsyncStorage]: NativeModule: AsyncStorage is null
```

This error means that AsyncStorage was unable to find its native module. This occurs because AsyncStorage was not linked into the final app bundle.

Make sure that you've run `pod install` or `pod update RNCAsyncStorage` (see also [CocoaPods issues](https://react-native-async-storage.github.io/async-storage/docs/help/troubleshooting/#ios-cocoapods-issues)).

If you have an Expo app, AsyncStorage will not work unless you eject the app. After ejecting the app, you may have to manually link depending on whether you chose to use Expo SDK.
