---
layout: single
permalink: /sad/
category: depression
title: &title "Fuck Depression"
date: "2017-01-23"
last_modified_at: "2018-04-16 15:25"
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
    btn_label: "Descend into Madness"
    btn_class: "btn--danger"
feature_row2:
  - image_path: /assets/images/2000-2001-wiperfluid.jpg
    alt: "The coldest winter."
    title: "Chapter 2: The Hungarian"
    excerpt: "In which we're all a little crazy."
    url: /post/completely-mental-part-two/
    btn_label: "Get Some Meds"
    btn_class: "btn--danger"
feature_row3:
  - image_path: /assets/images/kintsugi-wide-sm.jpg
    alt: "Kintsugi"
    title: "Chapter 3: Forever in Thirteen"
    excerpt: "We can't stop here. This is Bat Country."
    url: /post/completely-mental-part-three/
    btn_label: "Get Shattered"
    btn_class: "btn--danger"
feature_row4:
  - image_path: /assets/images/2018-pottery-kintsug-sm-teaser.jpg
    alt: "Kintsugi"
    title: "Chapter 4: Kintsugi"
    excerpt: "Shattered into a million pieces, and I'd do it again and again and again."
    url: /post/completely-mental-part-four/
    btn_label: "Get Mended"
    btn_class: "btn--danger"
# draft: {% include feature_row id="feature_row3" type="left" %}
#feature_row3:
#  - image_path: /assets/images/inside-out-group.jpg
#  title: "How IFS Has Been Working (For Me)"
#  excerpt: "IFS has been at the heart of my latest victories against the dark."
sidebar:
  nav: home
---

An ongoing series in my crusade against depression. 

{% include feature_row id="feature_row1" type="left" %}

{% include feature_row id="feature_row2" type="right" %}

{% include feature_row id="feature_row3" type="left" %}

{% include feature_row id="feature_row4" type="right" %}

# The Great? Depression

{% for post in site.categories.depression %}
  {% include archive-single.html type="grid" %}
{% endfor %}

