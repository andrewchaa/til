# Deploy Azure Function

As deploy function action has hanging issue, I use azure function core tools

```yaml
  deploy-api:
    needs: terraform
    name: 'Deploy Api'
    runs-on: ubuntu-latest
    env:
      AZURE_FUNCTIONAPP_NAME: api
      AZURE_FUNCTIONAPP_PACKAGE_PATH: '.'
      NODE_VERSION: '14.x'
    steps:
      - name: Checkout
        uses: actions/checkout@v2

      - name: Setup Node ${{ env.NODE_VERSION }} Environment
        uses: actions/setup-node@v2
        with:
          node-version: ${{ env.NODE_VERSION }}

      - name: Resolve Project Dependencies Using Yarn
        shell: bash
        run: |
          pushd './${{ env.AZURE_FUNCTIONAPP_PACKAGE_PATH }}'
          yarn
          yarn build
          yarn test
          popd

      - uses: azure/login@v1
        with:
          creds: ${{ secrets.AZURE_CREDENTIALS }}

      - name: Publish function
        shell: bash
        run: |
          yarn global add azure-functions-core-tools
          func azure functionapp publish ${{ env.AZURE_FUNCTIONAPP_NAME }} --typescript

```
