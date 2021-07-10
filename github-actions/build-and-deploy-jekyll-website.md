# Build and deploy Jekull website to AWS S3

I have been doing this manually but it would be really handy if it's automated.

Basically it consists of 4 steps

* check out the code
* build jekyll: `bundle exec jekyll build`
* copy all the files to S3: `aws s3 sync ./_site/ s3://${{ secrets.AWS_S3_BUCKET_NAME }} --acl public-read --delete --cache-control max-age=604800`
* invalidate cloudfront cache: `aws cloudfront create-invalidation --distribution-id ${{ secrets.AWS_CLOUDFRONT_DISTRIBUTION_ID }} --paths "/*"`


```yaml
name: Build and deploy

on: 
  push:
    branches: [master]

  workflow_dispatch:

env:
  AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
  AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
  AWS_DEFAULT_REGION: 'eu-west-1'

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: set up ruby
      uses: ruby/setup-ruby@v1
      with:
        ruby-version: '3.0'
        bundler-cache: true
    - name: build site
      run: bundle exec jekyll build
      env:
        JEKYLL_ENV: production
    - name: Deploy to AWS S3
      run: aws s3 sync ./_site/ s3://${{ secrets.AWS_S3_BUCKET_NAME }} --acl public-read --delete --cache-control max-age=604800
    - name: Invalidate Cloudfront
      run: aws cloudfront create-invalidation --distribution-id ${{ secrets.AWS_CLOUDFRONT_DISTRIBUTION_ID }} --paths "/*"
```
