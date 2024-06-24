---
layout: blog
title: A Causal Affair (non-substack edition)
---

<ul>
  {% for post in site.posts %}
    <li>
      <b> <a href="{{ post.url }}">{{ post.title }}</a> </b>

      <p> {{ post.date | date: "%B %-d, %Y" }}</p>

      {{ post.excerpt }}      
      <!-- <p><a href = "{{ post.url }}">Read more...</a></p> -->
  {% endfor %}