---
layout: archive
permalink: /sad/
category: depression
title: &title "Fuck Depression"
alt_title: *title
date: "2017-01-23"
last_modified_at: "2017-07-01"
excerpt: "This is some bullshit and it's got to stop."
header:
  overlay_image: /assets/images/emory-keep-going-crop.jpg
  overlay_filter: 0.5
  caption: "Photo by TM™, South Philadelphia, PA"
author_profile: true
---

{% for post in site.categories.depression %}
   {% include archive-single.html type="grid" %}
{% endfor %}
