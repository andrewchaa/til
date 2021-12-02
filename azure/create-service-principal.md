# Create an Azure service principal

What is a service principal?

> An Azure service principal is an identity created for use with applications, hosted services, and automated tools to access Azure resources

Create a service principal

    az ad sp create-for-rbac --name ServicePrincipalName --role Contributor
    
To delete the created service principal

    az ad sp delete --id <name>
