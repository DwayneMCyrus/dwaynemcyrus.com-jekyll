---
layout: page
title: Home
id: home
permalink: /
---

# Welcome! 🌱

<p style="padding: 3em 1em; background: #f5f7ff; border-radius: 4px;">
  Take a look at <span style="font-weight: bold">[[Your first note]]</span> to get started on your exploration.
</p>

This digital garden template is free, open-source, and [available on GitHub here](https://github.com/maximevaillancourt/digital-garden-jekyll-template).

The easiest way to get started is to read this [step-by-step guide explaining how to set this up from scratch](https://maximevaillancourt.com/blog/setting-up-your-own-digital-garden-with-jekyll).

<strong>Recently updated notes</strong>

<ul>
  {% assign recent_notes = site.notes | sort: "last_modified_at_timestamp" | reverse %}
  {% for note in recent_notes limit: 5 %}
    <li>
      {{ note.last_modified_at | date: "%Y-%m-%d" }} — <a class="internal-link" href="{{ site.baseurl }}{{ note.url }}">{{ note.title }}</a>
    </li>
  {% endfor %}
</ul>

<strong>Recently updated drugs</strong>

<ul>
  {% assign recent_drugs = site.drugs | sort: "last_modified_at_timestamp" | reverse %}
  {% for drug in recent_drugs limit: 5 %}
    <li>
      {{ drug.last_modified_at | date: "%Y-%m-%d" }} — <a class="internal-link" href="{{ site.baseurl }}{{ drug.url }}">{{ drug.title }}</a>
    </li>
  {% endfor %}
</ul>

<hr>

<strong> Staff members list </strong>
{% for staff_member in site.staff_members %}
  <h5>Title: {{ staff_member.name }} - {{ staff_member.position }}</h5>
  <p>{{ staff_member.content | markdownify }}</p>
{% endfor %}

{% for staff_member in site.staff_members %}
  <h6> Link Title: 
    <a href="{{ staff_member.url }}">
      {{ staff_member.name }} - {{ staff_member.position }}
    </a>
  </h6>
  <p>{{ staff_member.content | markdownify }}</p>
{% endfor %}


<style>
  .wrapper {
    max-width: 46em;
  }
</style>
