# Terraform

* [Terraform](https://www.terraform.io/)
* [installation](#installation)
* [create a plan](#create-a-plan)

### installation

```
brew install terraform
```

### create a plan

* create a template
* run plan

  ```
  terraform plan -var "github_repo=JsBeautifierWeb" -var "github_token=......"
  terraform apply -var "github_repo=JsBeautifierWeb" -var "github_token=......"
  ```