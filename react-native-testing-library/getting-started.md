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
  setupFiles: ['<rootDir>/jest.setup.js'],
  transformIgnorePatterns: [
    'node_modules/(?!(@react-native|react-native'
    + '|react-native-vector-icons|react-native-linear-gradient)/)'
  ]
}

```

jest.setup.js

```javascript
import mockRNCNetInfo from '@react-native-community/netinfo/jest/netinfo-mock.js'
import mockRNDeviceInfo from 'react-native-device-info/jest/react-native-device-info-mock'

jest.mock('@react-native-community/netinfo', () => mockRNCNetInfo)
jest.mock('react-native-device-info', () => mockRNDeviceInfo);

```

