---
layout: page
permalink: /publications/
title: publications
description:  Work is sorted by year in reverse chronological order. 
years: [2024, 2023, 2022, 2021, 2020, 2019]
nav: true
---
<!-- A print version is <a href="{{ Publications_by_Jared_Miller.pdf | prepend: '/assets/pdf/' | relative_url }}">available.</a> -->
<div class="publications">

{% for y in page.years %}
  <h2 class="year">{{y}}</h2>
  {% bibliography -f papers -q @*[year={{y}}]* %}
{% endfor %} 



</div>
