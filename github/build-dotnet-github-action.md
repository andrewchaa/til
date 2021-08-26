# Build .NET code with Github action

```yaml
name: 'CI'
on:
  push:
    branches:
      - main
  pull_request:
jobs:
  deploy-api:
    needs: terraform
    name: 'Deploy API'
    env:
      SOLUTION_NAME: './Wynwyn.sln'
    runs-on: ubuntu-latest
    environment: production
    steps:
      - name: Setup DotNet 5.x
        uses: actions/setup-dotnet@v1
        with:
          dotnet-version: '5.x'
      - uses: actions/checkout@main
      - name: dotnet build and publish
        run: |
          dotnet restore
          dotnet build --configuration Release
          dotnet publish -c Release -o '${{ env.AZURE_WEBAPP_PACKAGE_PATH }}/deploy'

```
