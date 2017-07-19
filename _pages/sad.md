---
layout: splash
permalink: /sad/
category: depression
title: &title "Fuck Depression"
date: "2017-01-23"
last_modified_at: "2017-07-18 16:10:17"
excerpt: "This is some bullshit and it's got to stop."
header:
  image: /assets/images/keep-going-wall-acros.jpg
  overlay_filter: rgba(204, 0, 139, 0.37)
author_profile: true
nav: "home"
feature_row1:
  - image_path: /assets/images/ed-grimley-snarl-teaser.jpg
    alt: "I'm completely mental, I must say."
    title: "Chapter 1: Finding Water"
    excerpt: "Since 1999 I've been surrendering to my depression. I'm done."
    url: /post/completely-mental/
    btn_label: "Begin"
    btn_class: "btn--danger"
feature_row2:
  - image_path: /assets/images/2000-2001-wiperfluid.jpg
    alt: "The coldest winter."
    title: "Chapter 2: The Hungarian"
    excerpt: "In which we're all a little crazy."
    url: /post/completely-mental-part-two/
    btn_label: "Get Meds"
    btn_class: "btn--danger"
#feature_row3:
#  - image_path: /assets/images/inside-out-group.jpg
#  title: "How IFS Has Been Working (For Me)"
#  excerpt: "IFS has been at the heart of my latest victories against the dark."
---

{% include feature_row id="feature_row1" type="left" %}

{% include feature_row id="feature_row2" type="right" %}

# Related:

{% for post in site.categories.depression %}
  {% include archive-single.html type="list" %}
{% endfor %}

