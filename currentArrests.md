---
layout: page
title: Current Arrests
permalink: /currentArrests/
---
<script>
  var arrests = {{ site.data.arrests }}
</script>

<div class="content">
  <table cellspacing="0" cellpadding="4" align="center" border="1">
    <thead>
      <tr>
        <th>ID #</th>
        <th>Name</th>
        <th>Arrest Date</th>
        <th>Statute/Charges</th>
        <th>Image</th>
      </tr>
    </thead>
    <tbody>
{% for arrest in site.data.arrests %}
      <tr>
        <td>{{ arrest.IDNumber }}</td>
        <td>{{ arrest.FirstName | capitalize }} {{ arrest.MiddleName | capitalize }} {{ arrest.LastName | capitalize }}</td>
        <td>
          {% for a in arrest.Arrests %}
          {{ a.ArrestDate }}<br>
          {% endfor %}
        </td>
        <td>
          {% for charge in arrest.Charges %}
          {{ charge.StatuteCode }}-{{ charge.StatuteDesc}}<br>
          {% endfor %}          
        </td>
        <td><img src="{{ arrest.ImageThumb }}"><br></td>
      </tr>
{% endfor %}
    </tbody>
  </table>
</div>