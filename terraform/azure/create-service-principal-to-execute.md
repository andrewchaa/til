# Create a service principal to execute terraform

> There is no way to directly create a service principal using the Azure portal. 
> When you register an application through the Azure portal, 
> an application object and service principal are automatically created in your home directory or tenant.

[Create an azure app](https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-create-service-principal-portal)

* Go to a subscription you want to allow the service principla to have access
* Go to Access Control (IAM)
* Create a role assignment
* Choose a role, `Contributor`, to provision resources with terraform
* Add a member. You have to search the name of your app
* Assign the app as a member to the role
