Create .env file

```yml
  - name: Run a multi-line script
    run: |
      touch .env
      echo 'NOTION_TOKEN=${{ secrets.NOTION_TOKEN }}' >> .env
      echo 'NOTION_DATABASE_ID=${{ secrets.NOTION_DATABASE_ID }}' >> .env
      yarn
      yarn start
```
