```ruby
{% for i in (1..33) %}
  {% capture image %}custom/gallery/korean/{{i}}.jpg{% endcapture %}
  {% include photo-container.html category='korean' image=image %}
{% endfor %}

```
