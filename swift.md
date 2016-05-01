**Resources**

* Dash documentation viewer: https://kapeli.com/dash
* NS Screen cast: http://nsscreencast.com/
* https://raywenderlich.com/
* https://iosbytes.codeschool.com/

**casting int to string**

```swift
cell.imageView?.image = UIImage(named: "image-cell" + String(indexPath.row + 1))
```

**UI without storyboard**

* Remove main interface from General tab
* set the custom view controller to main window

```swift
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
    let viewController = BeautifulWeatherViewController()
    
    let mainWindow = UIWindow(frame: UIScreen.mainScreen().bounds)
    mainWindow.backgroundColor = UIColor.whiteColor()
    mainWindow.rootViewController = viewController
    mainWindow.makeKeyAndVisible()
    
    window = mainWindow
          
    
    return true
}

```
