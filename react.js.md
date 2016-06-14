**Resources**

* https://github.com/coryhouse/pluralsight-redux-starter

**Setting up Atom**

* AirBnb Javascript Style Guid
* react
* terminal-plus
* linter
* linter-eslint

Dependencies

* babel-eslint
* eslint
* eslint-config-airbnb
* eslint-plugin-react
* react-native
* react-native-swipeout
* redux
* babel-node: Babel's second CLI which works exactly the same as Node.js' CLI, only it will compile ES6 code before running it. Not meant for production use
* npm-run-all: A CLI tool to run multiple npm-scripts in parallel or sequential

.eslint: https://gist.github.com/hendrikswan/2153ae77f1496d2b40aa

**npm scripts**

```javascript
  "scripts": {
    "prestart": "babel-node tools/startMessage.js",
    "start": "npm-run-all --parallel open:src lint:watch",
    "open:src": "babel-node tools/srcServer.js",
    "lint": "node_modules/.bin/esw webpack.config.* src tools",
    "lint:watch": "npm run lint -- --watch"
  },
```

**es linting**

* add .eslintrc
* npm run lint

```javascript
//package.json
  "scripts": {
    "prestart": "babel-node tools/startMessage.js",
    "start": "babel-node tools/srcServer.js",
    "lint": "node_modules/.bin/esw webpack.config.* src tools",
    "lint:watch": "npm run lint -- --watch"
  },

// .eslintrc
{
  "extends": [
    "eslint:recommended",
    "plugin:import/errors",
    "plugin:import/warnings"
  ],
  "plugins": [
    "react"
  ],
  "parserOptions": {
    "ecmaVersion": 6,
    "sourceType": "module",
    "ecmaFeatures": {
      "jsx": true
    }
  },
  "env": {
    "es6": true,
    "browser": true,
    "node": true,
    "jquery": true,
    "mocha": true
  },
  "rules": {
    "quotes": 0,
    "no-console": 1,
    "no-debugger": 1,
    "no-var": 1,
    "semi": [1, "always"],
    "no-trailing-spaces": 0,
    "eol-last": 0,
    "no-unused-vars": 0,
    "no-underscore-dangle": 0,
    "no-alert": 0,
    "no-lone-blocks": 0,
    "jsx-quotes": 1,
    "react/display-name": [ 1, {"ignoreTranspilerName": false }],
    "react/forbid-prop-types": [1, {"forbid": ["any"]}],
    "react/jsx-boolean-value": 1,
    "react/jsx-closing-bracket-location": 0,
    "react/jsx-curly-spacing": 1,
    "react/jsx-indent-props": 0,
    "react/jsx-key": 1,
    "react/jsx-max-props-per-line": 0,
    "react/jsx-no-bind": 1,
    "react/jsx-no-duplicate-props": 1,
    "react/jsx-no-literals": 0,
    "react/jsx-no-undef": 1,
    "react/jsx-pascal-case": 1,
    "react/jsx-sort-prop-types": 0,
    "react/jsx-sort-props": 0,
    "react/jsx-uses-react": 1,
    "react/jsx-uses-vars": 1,
    "react/no-danger": 1,
    "react/no-did-mount-set-state": 1,
    "react/no-did-update-set-state": 1,
    "react/no-direct-mutation-state": 1,
    "react/no-multi-comp": 1,
    "react/no-set-state": 0,
    "react/no-unknown-property": 1,
    "react/prefer-es6-class": 1,
    "react/prop-types": 1,
    "react/react-in-jsx-scope": 1,
    "react/require-extension": 1,
    "react/self-closing-comp": 1,
    "react/sort-comp": 1,
    "react/wrap-multilines": 1
  }
}

```

**tools and libraries**

* exponent js: https://exponentjs.com/
* ngrok: https://ngrok.com/

**change class name**

**Directory Structure**

* node_module
  * src 
* .editorconfig
* .gitignore
* .eslintrc
* package.json

```html
<span className={this.props.buttonIcon}></span>
```
