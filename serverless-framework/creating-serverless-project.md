# Creating a serverless project

First, install the latest npm package, `serverless`

```bash
npm i -g serverless
```

Check if you have installed serverless by running `serverless --version`

### Create a service

```bash
sls create --template aws-csharp --path myService
```

Using the create command we can specify one of the available templates. For this example use aws-csharp with the --template or shorthand -t flag.

The --path or shorthand -p is the location to be created with the template service files. Change directories into this new folder.

### Build using .NET Core 3.1 CLI tools and create zip package

```bash
# Linux or Mac OS
./build.sh

# Windows PowerShell
.\build.cmd
```

### Deploy

```bash
sls deploy
```

This will deploy your function to AWS Lambda based on the settings in serverless.yml.

## Invoke deployed function

```bash
sls invoke -f hello
```

Invoke deployed function with command invoke and --function or shorthand -f.

In your terminal window you should see the response from AWS Lambda.

```json
{
    "Message": "Go Serverless v1.0! Your function executed successfully!",
    "Request": {
        "Key1": null,
        "Key2": null,
        "Key3": null
    }
}
```
