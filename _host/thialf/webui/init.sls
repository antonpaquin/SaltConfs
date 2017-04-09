/home/hacker/webui/__main__.py:
  file.managed:
    - source: salt://_host/thialf/webui/__main__.py
    - user: pi
    - group: pi
    - mode: 666
    - makedirs: True

{% set resources = [
  'bulma.css',
  'main.html',
  'jquery.organictabs.js'
] %}

{% for resfile in resources %}
/home/hacker/webui/{{ resfile }}:
  file.managed:
    - source: salt://_host/thialf/webui/{{ resfile }}
    - user: root
    - group: root
    - mode: 644
    - makedirs: True
{% endfor %}

flask:
  pip.installed: []
