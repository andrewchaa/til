# Getting started with Jest

https://jestjs.io/

Install Jest

    npm install --save-dev jest
    npm i -g jest

configuration

```json
"jest": {
  "preset": "react-native",
  "moduleFileExtensions": ["ts", "tsx", "js", "jsx", "json", "node"],
  "transformIgnorePatterns": [
    "node_modules/(?!(@react-native|react-native|react-native-vector-icons)/)"
  ]
}

```
