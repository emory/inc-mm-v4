---
layout: archive
status: publish
published: true
permalink: /pages/index.html
title: Resources and Pages
excerpt: "Papers, business papers."
date: '2013-05-13 15:25:00'
modified: '2019-08-13 08:56:00'
feature:
  visible: true
  headline: "Non-article pages, guides, and lists."
  category: resources
tags: 
  - pages
  - resources
---

Pages upon pages. These are more like *documents*, structured lists[^un], or scribbles into a notepad more often than what I would consider a post or an article. They can and often do get updates as events warrant.

[^un]: Or completely un-structured lists. Six of one, and all.

{% include base_path %}
{% capture written_label %}'None'{% endcapture %}

{% for post in site.category.pages %}
  {% unless collection.output == false or collection.label == "posts" %}
    {% capture label %}{{ collection.label }}{% endcapture %}
    {% if label != written_label %}
      <h2 id="{{ label | slugify }}" class="archive__subtitle">{{ label }}</h2>
      {% capture written_label %}{{ label }}{% endcapture %}
    {% endif %}
  {% endunless %}
    {% unless collection.output == false or collection.label == "posts" %}
      {% include archive-single.html %}
    {% endunless %}
{% endfor %}

