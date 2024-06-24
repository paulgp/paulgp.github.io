---
layout: default
title: A Causal Affair (non-substack edition)
---

<ul>
  {% for post in site.posts %}
    <li>
      <b> <a href="{{ post.url }}">{{ post.title }}</a> </b>
      <p>{{ post.excerpt }}<a href="{{ post.url }}">Read more...</a></p>
    </li>
  {% endfor %}
</ul>
