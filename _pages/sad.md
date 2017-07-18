---
layout: archive
permalink: /sad/
category: depression
title: &title "Fuck Depression"
date: "2017-01-23"
last_modified_at: "2017-07-07 14:37:37"
excerpt: "This is some bullshit and it's got to stop."
header:
  image: /assets/images/keep-going-wall-acros.jpg
  overlay_filter: 0.5
author_profile: true
---

Honestly, what else can I say about it?

{% for post in site.categories.depression %}
  {% include archive-single.html type="grid" %}
{% endfor %}
