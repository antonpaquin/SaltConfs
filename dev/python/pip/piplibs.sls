{% set piplibs = [
  'pandas',
  'seaborn',
  'pandas-datareader',
  'gmpy2',
  'selenium'
] %}

{% for lib in piplibs %}
{{ lib }}:
  pip.installed:
    - require:
      - pkg: pip

{% endfor %}
