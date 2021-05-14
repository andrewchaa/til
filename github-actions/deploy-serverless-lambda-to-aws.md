# Deploying C# severless project to AWS lambda

I use github action to deploy my serverless lambda project. It's fast, reliable, and free with my private repo.

```yaml
name: Deploy main branch

on:
  push:
    branches:
      - main

jobs:
  deploy:
    name: deploy
    runs-on: ubuntu-latest
    strategy:
      matrix:
        node-version: [14.x]
    steps:
    - uses: actions/checkout@v2
    - name: Setup .NET Core SDK
      uses: actions/setup-dotnet@v1.7.2
      with:
        dotnet-version: 3.1.x
    - name: Use Node.js ${{ matrix.node-version }}
      uses: actions/setup-node@v1
      with:
        node-version: ${{ matrix.node-version }}
    - run: |
        mkdir ~/.aws
        (echo "[postcodeapi]"; echo "aws_access_key_id=${{ secrets.AWS_ACCESS_KEY_ID }}"; echo "aws_secret_access_key=${{ secrets.AWS_SECRET_ACCESS_KEY }}") > ~/.aws/credentials
        (echo "[postcodeapi]"; echo "region=eu-west-1"; echo "output=json") > ~/.aws/config
        npm i -g serverless
        pushd src/PostcodeApi.Apis
        dotnet restore
        dotnet tool install -g Amazon.Lambda.Tools --framework netcoreapp3.1
        dotnet lambda package --configuration Release --framework netcoreapp3.1 --output-package bin/Release/netcoreapp3.1/package.zip
        serverless deploy --stage dev
        serverless deploy --stage prod
      env:
        AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
        AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        AWS_SDK_LOAD_CONFIG: 1
```
