# serverless

* [Resource](#resource)
* [Prepare IAM for lambda](#prepare-iam-for-lambda)
* [Creating a service](#creating-a-service)

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
