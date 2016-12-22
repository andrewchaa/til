# install jekyll

```
brew install ruby
gem update --system
gem install jekyll bundler
bundler install
jekyll serve
```

# create a site

```
jekyll new my-site
```

# start jekyll server

```
jekyll serve
```

# build a static site

```
jekyll build
```

# layout and content

```
<!DOCTYPE html>
<html lang="en">
  {% include head.html %}

    <body>
      {% include navigation-bar.html %}

      {{ content }}

      {% include footer.html %}
      {% include scripts.html %}
    </body>
</html>

```
