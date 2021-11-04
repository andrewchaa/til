# Getting started with Jest

https://jestjs.io/

Install Jest

    npm install --save-dev jest
    npm i -g jest

configuration

```javascript
# jest.config.js

module.exports = {
  verbose: true,
  preset: "react-native",
  moduleFileExtensions: [
    "ts",
    "tsx",
    "js",
    "jsx",
    "json",
    "node"
  ],
  transformIgnorePatterns: [
    "node_modules/(?!(@react-native|react-native" 
    + "|react-native-vector-icons|react-native-linear-gradient)/)"
  ]
}
```

transformIgnorePatterns

Some `react-native` libraries ship uncompiled ES6 code. It needs to be compiled before it can be run by `Jest`.

You can tell `Jest` to compile those packages by whitelisting them in the `transformIgnorePatterns` option in the jest config.

The transformIgnorePatterns option (which is an array of Regular-Expressions) is originally meant to exclude files from being compiled, but using (?!(some-dir-name|another-name)) pattern (the (?!...), negative look-ahead), we do tell Jest to exclude anything in node_modules directory, except the names that we did specify.
