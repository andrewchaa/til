# Detox

Detox is 

> Gray box end-to-end testing and automation framework for mobile apps

### Getting started

* https://github.com/wix/Detox/blob/master/docs/Introduction.GettingStarted.md
* https://github.com/wix/Detox/blob/master/docs/Introduction.iOSDevEnv.md
* https://github.com/wix/Detox/blob/master/docs/Guide.Jest.md
* https://jestjs.io/

Install packages

    # cli and pre-requisites
    npm i -g detox-cli
    brew tap wix/brew
    brew install applesimutils

    # add detox to the project
    npm i detox --save-dev

    # add jest to the project
    npm install-D jest

Create scaffolds

    detox init -r jest

Set binary path from `SPECIFY_PATH_TO_YOUR_APP_BINARY` to the real path

    "binaryPath": "../../Library/Developer/Xcode/DerivedData/navienapp-cptnavaokaehklgmjextcexaxeks/Build/Products/Debug-iphonesimulator/navienapp.app"


To run tests

    detox test --configuration ios
