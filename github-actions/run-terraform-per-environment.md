```yml
name: Deploy

on:
  push:
    branches:
      - main
  workflow_dispatch:

env:
  AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
  AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
  AWS_SDK_LOAD_CONFIG: 1

jobs:
  deploy-dev:
    name: deploy dev
    defaults:
      run:
        working-directory: "./terraforms"
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v3
    - name: Set up Terraform
      uses: hashicorp/setup-terraform@v1
    - name: Terraform Init
      run: terraform init
      id: init
    - name: Terraform Plan
      id: plan
      run: terraform plan -no-color -input=false -var 'environment=dev'
      continue-on-error: true
    - name: Terraform Plan Status
      if: steps.plan.outcome == 'failure'
      run: exit 1
    - name: Terraform Apply
      id: apply
      if: github.ref == 'refs/heads/main' && github.event_name == 'push'
      run: terraform apply -auto-approve -input=false -var 'environment=dev'

  deploy-prod:
    name: deploy prod
    needs: deploy-dev
    defaults:
      run:
        working-directory: "./terraforms"
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v3
    - name: Set up Terraform
      uses: hashicorp/setup-terraform@v1
    - name: Update terraform backend key
      run: sed -i 's/terraform-state-dev/terraform-state-prod/' config.tf
    - name: Terraform Init
      run: terraform init
      id: init
    - name: Terraform Plan
      id: plan
      run: terraform plan -no-color -input=false -var 'environment=prod'
      continue-on-error: true
    - name: Terraform Plan Status
      if: steps.plan.outcome == 'failure'
      run: exit 1
    - name: Terraform Apply
      id: apply
      if: github.ref == 'refs/heads/main' && github.event_name == 'push'
      run: terraform apply -auto-approve -input=false -var 'environment=prod'

```
