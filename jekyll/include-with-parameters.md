# simple include

```html
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

```

# include with array variable

```
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
