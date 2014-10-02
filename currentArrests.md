---
layout: page
title: Current Arrests
permalink: /currentArrests/
---

<div class="row"> 
{% for arrest in site.data.arrests %}
{{ arrest.FirstName | capitalize }} {{ arrest.LastName | capitalize }}
<img src="{{ arrest.ImageThumb }}"><br>
{% endfor %}
</div>