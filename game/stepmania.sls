{% set stepmania = {
  'Gentoo': 'games-arcade/stepmania',
}.get(grains.os_family) %}

stepmania:
  pkg.installed:
    - name: {{ stepmania }}
{% if grains.os_family == 'Gentoo' %}
    - require:
      - layman: gentoo-zh
{% endif %}
