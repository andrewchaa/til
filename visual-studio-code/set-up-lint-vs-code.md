# Setting up lint on VS Code

[Getting started with ESLint](https://eslint.org/docs/user-guide/getting-started) is the official guide, but this is what I did.

```
npm install eslint --save-dev
npx eslint --init
```

I don't like adding semicolon at the end, so I did this.

```
  rules: {
    semi: ["never"]
  },
```
