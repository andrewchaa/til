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
