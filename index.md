---
layout: page
title: Learning programming
tagline: Learning programming (with Go)
---
{% include JB/setup %}

Complete usage and documentation available at: [Jekyll Bootstrap](http://jekyllbootstrap.com)

<ul class="posts">
  {% for post in site.posts %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>

## To-Do

This theme is still unfinished. If you'd like to be added as a contributor, [please fork](http://github.com/dbtek/jekyll-bootstrap-3)!
