# serverless

* [Resource](#resource)
* [Prepare IAM for lambda](#prepare-iam-for-lambda)
* [Creating a service](#creating-a-service)
* [Access Environment Variables](#access-environment-variables)

### Resource

* https://serverless.com/framework/docs/providers/aws/examples/hello-world/csharp/#1-create-a-service

### Prepare IAM for lambda

Not ideal but quick fix
* AmazonS3FullAccess
* AWSLambdaFullAccess
* CloudFormation
* Lambda Iam, all roles

### Creating a service

```
# install serverless
npm install -g serverless

# create a project
sls create --template aws-csharp --path GroovyFood  

# build the project
./build.sh

# deploy
sls deploy
```

### Access Environment Variables

```csharp
static Func<string, string> Get = (key) => Environment.GetEnvironmentVariable(key);

public static string ApiBaseUri => "https://api.gdax.com";
public static string ApiKey => Get("api_key");
public static string ApiSecret => Get("api_secret");
public static string Passphrase => Get("passphrase");

```
