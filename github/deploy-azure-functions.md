# Deploy Azure functions with Github actions

```yaml
name: 'build and deploy'
on:
  push:
    branches:
      - main
  workflow_dispatch:

env:
  DOTNET_VERSION: '3.x'
  AZURE_FUNCTIONAPP_NAME: 'showmethemoney'
  AZURE_FUNCTIONAPP_PACKAGE_PATH: 'src/Deepeyes.ShowMeMoney.Apis'
  ARM_CLIENT_ID: ${{ secrets.AZURE_AD_CLIENT_ID }}
  ARM_CLIENT_SECRET: ${{ secrets.AZURE_AD_CLIENT_SECRET }}
  ARM_SUBSCRIPTION_ID: ${{ secrets.AZURE_SUBSCRIPTION_ID }}
  ARM_TENANT_ID: ${{ secrets.AZURE_AD_TENANT_ID }}

jobs:
  terraform:

    name: 'Terraform'
    defaults:
      run:
        working-directory: "./terraform"

    runs-on: ubuntu-latest
    environment: production
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v1
      - name: Terraform Format
        id: fmt
        run: terraform fmt -check
      - name: Terraform Init
        id: init
        run: terraform init
      - name: Terraform Plan
        id: plan
        run: terraform plan -no-color
        continue-on-error: true
      - name: Terraform Plan Status
        if: steps.plan.outcome == 'failure'
        run: exit 1
      - name: Terraform Apply
        if: github.ref == 'refs/heads/main' && github.event_name == 'push'
        run: terraform apply -auto-approve
  build:
    needs: terraform
    runs-on: ubuntu-latest
    steps:
    - name: 'Checkout GitHub Action'
      uses: actions/checkout@main

    - name: Setup DotNet ${{ env.DOTNET_VERSION }} Environment
      uses: actions/setup-dotnet@v1
      with:
        dotnet-version: ${{env.DOTNET_VERSION}}

    - name: 'Build'
      shell: bash
      run: |
        pushd './${{ env.AZURE_FUNCTIONAPP_PACKAGE_PATH }}'
        dotnet build --configuration Release --output ./output
        popd

    - name: 'Deploy Azure Functions'
      uses: Azure/functions-action@v1.3.2
      id: fa
      with:
        app-name: ${{ env.AZURE_FUNCTIONAPP_NAME }}
        package: '${{ env.AZURE_FUNCTIONAPP_PACKAGE_PATH }}/output'
        publish-profile: ${{ secrets.AZURE_FUNCTIONAPP_PUBLISH_PROFILE }}

```
