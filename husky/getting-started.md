# Getting started with husky

https://github.com/typicode/husky

Install

    npm i -D husky
    
Usage

    npm set-script prepare "husky install"
    npm run prepare
    
    npx husky add .husky/pre-commit "npm test"
    git add .husky/pre-commit
    
    git commit -am "commit"
    # npm test runs
