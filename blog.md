---
layout: blog
title: A Causal Affair
---

<ul>
  {% for post in site.posts %}
    {% unless post.exclude %}
    <li>
      <b> <a href="{{ post.url }}">{{ post.title }}</a> </b>
      <p> {{ post.date | date: "%B %-d, %Y" }}</p>
      {{ post.excerpt }}       
    {% endunless %}
  {% endfor %}