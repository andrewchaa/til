# Getting started with react native testing library

    yarn add --dev @testing-library/react-native
    yarn add --dev react-test-renderer 


Create jest setup to mock native modules

jest.config.js

```javascript
module.exports = {
  verbose: true,
  preset: 'react-native',
  moduleFileExtensions: [
    'ts',
    'tsx',
    'js',
    'jsx',
    'json',
    'node',
  ],
  moduleNameMapper: {
    "styled-components" : "<rootDir>/node_modules/styled-components/native/dist/styled-components.native.cjs.js"

  },
  setupFiles: [
    '<rootDir>/jest.setup.js',
    '<rootDir>/node_modules/react-native-gesture-handler/jestSetup.js'
  ],
  transformIgnorePatterns: [
    'node_modules/(?!(jest-)?@?react-native|@react-native-community|@react-navigation)',
  ]
}

```

jest.setup.js

```javascript
import mockRNCNetInfo from '@react-native-community/netinfo/jest/netinfo-mock.js'
import mockRNDeviceInfo from 'react-native-device-info/jest/react-native-device-info-mock'
import { NativeModules as RNNativeModules } from "react-native";

jest.mock('@react-native-community/netinfo', () => mockRNCNetInfo)
jest.mock('react-native-device-info', () => mockRNDeviceInfo);

RNNativeModules.UIManager = RNNativeModules.UIManager || {};
RNNativeModules.UIManager.RCTView = RNNativeModules.UIManager.RCTView || {};
RNNativeModules.RNGestureHandlerModule = RNNativeModules.RNGestureHandlerModule || {
  State: { BEGAN: "BEGAN", FAILED: "FAILED", ACTIVE: "ACTIVE", END: "END" },
  attachGestureHandler: jest.fn(),
  createGestureHandler: jest.fn(),
  dropGestureHandler: jest.fn(),
  updateGestureHandler: jest.fn(),

};
RNNativeModules.PlatformConstants = RNNativeModules.PlatformConstants || {
  forceTouchAvailable: false
};

```

jest 27.x version incompatibility


    yarn add --dev @jest/create-cache-key-function

```json

  "resolutions": {
    "react-native/@jest/create-cache-key-function": "^27.0.2"
  }

```
