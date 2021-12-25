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

By default, the Functions runtime looks for your function in index.js, where index.js shares the same parent directory as its corresponding function.json

Exporting an async function

```javascript
module.exports = async function (context) {
    context.log('JavaScript trigger function processed a request.');
};
```

To assign an output using return, change the name property to $return in function.json.

```json
{
  "type": "http",
  "direction": "out",
  "name": "$return"
}
```

In this case, your function should look like the following example:

```JavaScript
module.exports = async function (context, req) {
    context.log('JavaScript HTTP trigger function processed a request.');
    // You can call and await an async method here
    return {
        body: "Hello, world!"
    };
}
```

### Inputs

Input are divided into two categories in Azure Functions: one is the trigger input and the other is the additional input. Trigger and other input bindings (bindings of direction === "in") can be read by a function in three ways:

As parameters passed to your function. They are passed to the function in the same order that they are defined in function.json. The name property defined in function.json does not need to match the name of your parameter, although it should.

```JavaScript
module.exports = async function(context, myTrigger, myInput, myOtherInput) { ... };
```
As members of the context.bindings object. Each member is named by the name property defined in function.json.

```JavaScript
module.exports = async function(context) { 
    context.log("This is myTrigger: " + context.bindings.myTrigger);
    context.log("This is myInput: " + context.bindings.myInput);
    context.log("This is myOtherInput: " + context.bindings.myOtherInput);
};
```


### Install Azure Functions Core Tools and Azurite

* [Azure Functions Core Tools](https://www.npmjs.com/package/azure-functions-core-tools)
* [Azurite](https://github.com/Azure/Azurite)

Make sure you have `local.settings.json` so that `func start` can discover your function


### Writing Azure function app with Rider

By default, [Rider](https://www.jetbrains.com/rider/) doesn't have the template for Azure function.

Go to Settings > Plugins and install "Azure Tookit for Rider"


Then go to Settings > Tools and install the latest version of `Azure Functions Core Tool`

Now you are ready to create a Function app project.

