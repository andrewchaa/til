# Azure Function in JavaScript

A JavaScript (Node.js) function is an exported function that executes when triggered (triggers are configured in function.json).

Folder structure

```
FunctionsProject
 | - MyFirstFunction
 | | - index.js
 | | - function.json
 | - MySecondFunction
 | | - index.js
 | | - function.json
 | - SharedCode
 | | - myFirstHelperFunction.js
 | | - mySecondHelperFunction.js
 | - node_modules
 | - host.json
 | - package.json
 | - extensions.csproj
 ```
 
At the root of the project, there's a shared host.json file that can be used to configure the function app. Each function has a folder with its own code file (.js) and binding configuration file (function.json)

### Install Azure Functions Core Tools and Azurite

* [Azure Functions Core Tools](https://www.npmjs.com/package/azure-functions-core-tools)
* [Azurite](https://github.com/Azure/Azurite)

Make sure you have `local.settings.json` so that `func start` can discover your function


### Writing Azure function app with Rider

By default, [Rider](https://www.jetbrains.com/rider/) doesn't have the template for Azure function.

Go to Settings > Plugins and install "Azure Tookit for Rider"


Then go to Settings > Tools and install the latest version of `Azure Functions Core Tool`

Now you are ready to create a Function app project.

