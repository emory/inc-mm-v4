---
layout: archive
title: "Sitemap"
permalink: /sitemap/
date: 2015-05-05
modified: 2016-07-14
excerpt: "A visual sitemap of incumbent.org"
share: false
sidebar:
  nav: "home"
---

Four out of five robots and crawlers agree: the [XML version]({{ site.url }}/sitemap.xml) is far superior and flavorful. Most humans like this one better.

<h2>Pages</h2>
{% for post in site.pages %}
  {% include archive-single.html %}
{% endfor %}

<h2>Posts</h2>
{% for post in site.posts %}
  {% include archive-single.html %}
{% endfor %}

{% capture written_label %}'None'{% endcapture %}

{% for collection in site.collections %}
{% unless collection.output == false or collection.label == "posts" %}
  {% capture label %}{{ collection.label }}{% endcapture %}
  {% if label != written_label %}
  <h2>{{ label }}</h2>
  {% capture written_label %}{{ label }}{% endcapture %}
  {% endif %}
{% endunless %}
{% for post in collection.docs %}
  {% unless collection.output == false or collection.label == "posts" %}
  {% include archive-single.html %}
  {% endunless %}
{% endfor %}
{% endfor %}
