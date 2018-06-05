# Jekyll

1. [Getting Started](#getting-started)
1. [Deployment](#deployment)
1. [Setting Up Custom Domain](#setting-up-custom-domain)
1. [Usage](#usage)
1. [Deploying by s3_website](#deploying-by-s3-website)




## <a href="#getting-started">Getting Started</a>

### Resource

* https://shopify.github.io/liquid/
* http://jekyll.tips/jekyll-cheat-sheet/
* https://gist.github.com/smutnyleszek/9803727
* http://jekyllthemes.org/
* https://github.com/mattvh/jekyllthemes




```

// install jekyll
brew install ruby
gem update --system
gem install jekyll bundler
bundler install
jekyll serve

// create a site
jekyll new my-site

// start jekyll server
jekyll serve

// build a static site
jekyll build
```

```html
// layout and content
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

## <a href="#deployment">Deployment</a>

* http://jmcglone.com/guides/github-pages/
* Go to settings and set github pages branch to master
* The default address becomes like http://andrewchaa.github.io/funkorean
* set the custom domain


```html
// Use site.github.url**

<link rel="stylesheet" href="{{ "/css/bootstrap.min.css" | prepend: site.github.url }}">
<link rel="stylesheet" href="{{ "/css/site.css" | prepend: site.github.url }}">
```

### Custome domain

1. In Settings, enter your custom domain, www.londoneducationtour.com
1. Create a CNAME record that points from your default pages domain, such as YOUR-GITHUB-USERNAME.github.io to your subdomain. Your DNS changes can take over a full day to update and the wait varies among DNS and hosting providers.

  * cname, www, andrewchaa.github.io
  * URL Redirect Record, @, http://www.asianlancook.org

3. Test if the domain is correctly set up
   
   ```
   dig www.londoneducationtour.com +nostats +nocomments =nocmd
   ```

## <a href="#usage">Usage</a>


```html
// simple include

<div class="col-sm-4 isotopeSelector {{ include.keyword }}">
  <article class="">
    <figure>
      <img src="{{ include.image }}" alt="">
      <h4>{{ include.title }}</h4>
      <div class="overlay-background">
        <div class="inner"></div>
      </div>
    </figure>
  </article>
</div>


<div class="row isotopeContainer">
    {% include university-figure.html image="img/universities/oxford-1.jpg" title="Oxford" keyword="oxford" %}
    {% include university-figure.html image="img/universities/rcm-2.jpg" title="Royal College of Music" keyword="rcm" %}
    {% include university-figure.html image="img/universities/british-museum-1.jpg" title="British museum" keyword="british-museum" %}
</div>


// include with array variable
{%
  include bullet-box.html
  lists="improve the function of ovaries|
         regulate the hormones to produce a larger number of follicles|
         increase the blood flow to the uterus|
         increase the thickness of the uterine lining|
         improve semen to create better quality &amp; quantity of embryos|
         decrease the chances of miscarriage|
         lessen the side effects of drugs used in IVF and stress!"
%}

<div class="row" style="font-size: 14px;">
  <ul class="col-xs-12 list-unstyled lists-v1">
    {% assign lists = include.lists | split: "|"  %}
    {% for list in lists %}
      <li><i class="fa fa-angle-right"></i>{{ list | strip }}</li>
    {% endfor %}
  </ul>
</div>
```

```ruby
# inspect variable
{{ include.image | inspect }}


# storing variable
{% for i in (1..33) %}
  {% capture image %}custom/gallery/korean/{{i}}.jpg{% endcapture %}
  {% include photo-container.html category='korean' image=image %}
{% endfor %}


```

## Deploying by s3 website

Test

```ruby
# Install s3_website gem
gem install s3_website

# Download jdk 8 from http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html and install it

# Install jenv
brew install jenv

# Add that JDK (jdk1.8.0_xxx.jdk) to jenv
jenv add /Library/Java/JavaVirtualMachines/jdk1.8.0_162.jdk/Contents/Home/

# View all versions in jenv to confirm jdk1.8.0_162.jdk is present
jenv versions

# Configure the global version in jenv to be jdk1.8.0_162.jdk
jenv global oracle64-1.8.0.162

# installation
gem install s3_website

# to generate s3_website.yml
s3_website cfg create

# configure s3_website.yml
s3_bucket: www.hyeeun-acupuncture.co.uk
site: ./_site
s3_endpoint: eu-west-2

# to apply the config file
s3_website cfg apply

# to push
s3_website push
```
