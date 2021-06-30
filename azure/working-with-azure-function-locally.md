# Developing and running Azure functions on a local machine


First, install the [Azure Functioins Core Tools](https://www.npmjs.com/package/azure-functions-core-tools).

```
brew tap azure/functions
brew install azure-functions-core-tools@3
# if upgrading on a machine that has 2.x installed
brew link --overwrite azure-functions-core-tools@3
```

### Register extensions

With the exception of HTTP and timer triggers, Functions bindings in runtime version 2.x and higher are implemented as extension packages. HTTP bindings and timer triggers don't require extensions.

```json
{
    "version": "2.0",
    "extensionBundle": {
        "id": "Microsoft.Azure.Functions.ExtensionBundle",
        "version": "[1.*, 2.0.0)"
    }
}
```

Install all extensions

```
func extensions install
```

### Local settings file

The local.settings.json file stores app settings, connection strings, and settings used by local development tools. Settings in the local.settings.json file are used only when you're running projects locally. The local settings file has this structure:

```json
{
  "IsEncrypted": false,
  "Values": {
    "FUNCTIONS_WORKER_RUNTIME": "<language worker>",
    "AzureWebJobsStorage": "<connection-string>",
    "AzureWebJobsDashboard": "<connection-string>",
    "MyBindingConnection": "<binding-connection-string>",
    "AzureWebJobs.HttpExample.Disabled": "true"
  },
  "Host": {
    "LocalHttpPort": 7071,
    "CORS": "*",
    "CORSCredentials": false
  },
  "ConnectionStrings": {
    "SQLConnectionString": "<sqlclient-connection-string>"
  }
}
```

Install [Azurite](https://github.com/Azure/Azurite) and run it

    npm install -g azurite
    azurite -s -l c:\github\azurite -d c:\github\azurite\debug.log

### Run functions locally

```
func start
```

## Resource

* https://docs.microsoft.com/en-us/azure/azure-functions/functions-run-local?tabs=macos%2Ccsharp%2Cbash

