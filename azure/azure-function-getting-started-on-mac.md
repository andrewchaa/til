# Getting started with Azure Functions on Mac

### Writing Azure function app with Rider

By default, [Rider](https://www.jetbrains.com/rider/) doesn't have the template for Azure function.

Go to Settings > Plugins and install "Azure Tookit for Rider"

![Plugins](https://github.com/andrewchaa/til/raw/master/azure-functions/azure-tookit-for-rider.png)

Then go to Settings > Tools and install the latest version of `Azure Functions Core Tool`

![Tools](https://github.com/andrewchaa/til/raw/master/azure-functions/azure-tools-functions.png)

Now you are ready to create a Function app project.

### Install Azure Functions Core Tools and Azurite

* [Azure Functions Core Tools](https://www.npmjs.com/package/azure-functions-core-tools)
* [Azure Storage Explorer](https://azure.microsoft.com/en-us/features/storage-explorer/)

Make sure you have `local.settings.json` so that `func start` can discover your function
