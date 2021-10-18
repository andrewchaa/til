# Deploy static website to Azure Blob Storage

Use azure clie: `az storage blob upload-batch` 

```yaml
name: 'build and deploy'
on:
  push:
    branches:
      - main
  workflow_dispatch:

env:
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
      - uses: actions/checkout@v2
      - uses: hashicorp/setup-terraform@v1
      - run: terraform fmt -check
      - run: terraform init
      - run: terraform plan -no-color
        continue-on-error: true
      - name: Terraform Plan Status
        if: steps.plan.outcome == 'failure'
        run: exit 1
      - name: Terraform Apply
        if: github.ref == 'refs/heads/main' && github.event_name == 'push'
        run: terraform apply -auto-approve
  deploy-website:
    needs: terraform
    name: 'Deploy website'
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-node@v2
        with:
          node-version: '16'
      - run: npm install
      - run: npm run build
      - uses: azure/login@v1
        with:
          creds: ${{ secrets.AZURE_CREDENTIALS }}
      - name: Upload to blob storage
        uses: azure/CLI@v1
        with:
          azcliversion: 2.29.0
          inlineScript: |
            az storage blob upload-batch --account-name sekyeeondev --auth-mode key -d '$web' -s ./public


```
