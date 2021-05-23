# Setting up [development environment](https://reactnative.dev/docs/environment-setup)


## Installing dependencies

Node and Watchment

```bash
brew install node
brew install watchman
```

Install XCode via [App Store](https://itunes.apple.com/us/app/xcode/id497799835?mt=12)

Command Line Tools#
You will also need to install the Xcode Command Line Tools. Open Xcode, then choose "Preferences..." from the Xcode menu. Go to the Locations panel and install the tools by selecting the most recent version in the Command Line Tools dropdown.

CocoaPods

```bash
sudo gem install cocoapods
```

React Native CLI

```bash
npx react-native init AwesomeProject
```

Running your React Native application

```bash
npx react-native start
npx react-native run-ios
```

IOS Projects

* info.plist: App Transport Security Settings -> Allow Arbitrary Loads in Web Content: YES
