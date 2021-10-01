
# AssemblyInfo.cs

> AssemblyInfo.cs contains information about your assembly, like name, description, version, etc. You can find more details about its content reading the comments that are included in it.

Yuo can set a directive that applies to the assembly

```csharp
using Amazon.Lambda.Core;

// Assembly attribute to enable the Lambda function's JSON input to be converted into a .NET class.
[assembly: LambdaSerializer(typeof(Amazon.Lambda.Serialization.SystemTextJson.DefaultLambdaJsonSerializer))]
```
