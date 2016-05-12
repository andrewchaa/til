**Resources**

* Dash documentation viewer: https://kapeli.com/dash
* NS Screen cast: http://nsscreencast.com/
* https://raywenderlich.com/
* https://iosbytes.codeschool.com/
* Renaming a project physical folder: http://stackoverflow.com/questions/8262613/renaming-xcode-4-project-and-the-actual-folder

**xcode shortcuts**

* go back: ctrl + cmd + <-
* reveal in project navigator: shft + cmd + J

**NSLog**

```swift
NSLog("Error: \(error)")
```

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

**unresolved identifier 'layout'**

Use constrain instead

```swift
func layoutView() {
    constrain(backgroundView) { view in
        view.top == view.superview!.top
        view.bottom == view.superview!.bottom
        view.left == view.superview!.left
        view.right == view.superview!.right
    }
}
```

**float and edge type conversion error**

the type of superview!.top is CGFloat

```swift
let currentWeatherInsect: Float = Float(view.frame.height) - Float(currentWeatherView.frame.height) - 10
constrain(currentWeatherView) { view in
    view.top == view.superview!.top + CGFloat(currentWeatherInsect)
    return
}
```
